<?php
/**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */

/**
 * @property SpecificPriceRule $object
 */
class AdminSpecificPriceRuleControllerCore extends AdminController
{
    public $list_reduction_type;

    public function __construct()
    {
        $this->bootstrap = true;
        $this->table = 'specific_price_rule';
        $this->className = 'SpecificPriceRule';
        $this->lang = false;
        $this->multishop_context = Shop::CONTEXT_ALL;

        parent::__construct();

        /* if $_GET['id_shop'] is transmitted, virtual url can be loaded in config.php, so we wether transmit shop_id in herfs */
        if ($this->id_shop = (int) Tools::getValue('shop_id')) {
            $_GET['id_shop'] = $this->id_shop;
            $_POST['id_shop'] = $this->id_shop;
        }

        $this->list_reduction_type = array(
            'percentage' => $this->trans('Percentage', array(), 'Admin.Global'),
            'amount' => $this->trans('Amount', array(), 'Admin.Global'),
        );

        $this->addRowAction('edit');
        $this->addRowAction('delete');

        $this->_select = 's.name shop_name, cu.iso_code as currency_iso_code, cl.name country_name, gl.name group_name';
        $this->_join = 'LEFT JOIN ' . _DB_PREFIX_ . 'shop s ON (s.id_shop = a.id_shop)
		LEFT JOIN ' . _DB_PREFIX_ . 'currency cu ON (cu.id_currency = a.id_currency)
		LEFT JOIN ' . _DB_PREFIX_ . 'country_lang cl ON (cl.id_country = a.id_country AND cl.id_lang=' . (int) $this->context->language->id . ')
		LEFT JOIN ' . _DB_PREFIX_ . 'group_lang gl ON (gl.id_group = a.id_group AND gl.id_lang=' . (int) $this->context->language->id . ')';
        $this->_use_found_rows = false;

        $this->bulk_actions = array(
            'delete' => array(
                'text' => $this->trans('Delete selected', array(), 'Admin.Actions'),
                'confirm' => $this->trans('Delete selected items?', array(), 'Admin.Notifications.Warning'),
                'icon' => 'icon-trash',
            ),
        );

        $this->fields_list = array(
            'id_specific_price_rule' => array(
                'title' => $this->trans('ID', array(), 'Admin.Global'),
                'align' => 'center',
                'class' => 'fixed-width-xs',
            ),
            'name' => array(
                'title' => $this->trans('Name', array(), 'Admin.Global'),
                'filter_key' => 'a!name',
                'width' => 'auto',
            ),
            'shop_name' => array(
                'title' => $this->trans('Shop', array(), 'Admin.Global'),
                'filter_key' => 's!name',
            ),
            'currency_name' => array(
                'title' => $this->trans('Currency', array(), 'Admin.Global'),
                'align' => 'center',
                'filter_key' => 'cu!name',
            ),
            'country_name' => array(
                'title' => $this->trans('Country', array(), 'Admin.Global'),
                'align' => 'center',
                'filter_key' => 'cl!name',
            ),
            'group_name' => array(
                'title' => $this->trans('Group', array(), 'Admin.Global'),
                'align' => 'center',
                'filter_key' => 'gl!name',
            ),
            'from_quantity' => array(
                'title' => $this->trans('From quantity', array(), 'Admin.Catalog.Feature'),
                'align' => 'center',
                'class' => 'fixed-width-xs',
            ),
            'reduction_type' => array(
                'title' => $this->trans('Reduction type', array(), 'Admin.Catalog.Feature'),
                'align' => 'center',
                'type' => 'select',
                'filter_key' => 'a!reduction_type',
                'list' => $this->list_reduction_type,
            ),
            'reduction' => array(
                'title' => $this->trans('Reduction', array(), 'Admin.Catalog.Feature'),
                'align' => 'center',
                'type' => 'decimal',
                'class' => 'fixed-width-xs',
            ),
            'from' => array(
                'title' => $this->trans('Beginning', array(), 'Admin.Catalog.Feature'),
                'align' => 'right',
                'type' => 'datetime',
                'filter_key' => 'a!from',
                'order_key' => 'a!from',
            ),
            'to' => array(
                'title' => $this->trans('End', array(), 'Admin.Catalog.Feature'),
                'align' => 'right',
                'type' => 'datetime',
                'filter_key' => 'a!to',
                'order_key' => 'a!to',
            ),
        );
    }

    public function initPageHeaderToolbar()
    {
        if (empty($this->display)) {
            $this->page_header_toolbar_btn['new_specific_price_rule'] = array(
                'href' => self::$currentIndex . '&addspecific_price_rule&token=' . $this->token,
                'desc' => $this->trans('Add new catalog price rule', array(), 'Admin.Catalog.Feature'),
                'icon' => 'process-icon-new',
            );
        }

        parent::initPageHeaderToolbar();
    }

    public function getList($id_lang, $order_by = null, $order_way = null, $start = 0, $limit = null, $id_lang_shop = false)
    {
        parent::getList($id_lang, $order_by, $order_way, $start, $limit, $id_lang_shop);

        foreach ($this->_list as $k => $list) {
            if (null !== $this->_list[$k]['currency_iso_code']) {
                $currency = new Currency(Currency::getIdByIsoCode($this->_list[$k]['currency_iso_code']));
                $this->_list[$k]['currency_name'] = $currency->name;
            }

            if ($list['reduction_type'] == 'amount') {
                $this->_list[$k]['reduction_type'] = $this->list_reduction_type['amount'];
            } elseif ($list['reduction_type'] == 'percentage') {
                $this->_list[$k]['reduction_type'] = $this->list_reduction_type['percentage'];
            }
        }
    }

    public function renderForm()
    {
        if (!$this->object->id) {
            $this->object->price = -1;
        }

        $this->fields_form = array(
            'legend' => array(
                'title' => $this->trans('Catalog price rules', array(), 'Admin.Catalog.Feature'),
                'icon' => 'icon-dollar',
            ),
            'input' => array(
                array(
                    'type' => 'text',
                    'label' => $this->trans('Name', array(), 'Admin.Global'),
                    'name' => 'name',
                    'maxlength' => 255,
                    'required' => true,
                ),
                array(
                    'type' => 'select',
                    'label' => $this->trans('Shop', array(), 'Admin.Global'),
                    'name' => 'shop_id',
                    'options' => array(
                        'query' => Shop::getShops(),
                        'id' => 'id_shop',
                        'name' => 'name',
                    ),
                    'condition' => Shop::isFeatureActive(),
                    'default_value' => Shop::getContextShopID(),
                ),
                array(
                    'type' => 'select',
                    'label' => $this->trans('Currency', array(), 'Admin.Global'),
                    'name' => 'id_currency',
                    'options' => array(
                        'query' => array_merge(array(0 => array('id_currency' => 0, 'name' => $this->trans('All currencies', array(), 'Admin.Global'))), Currency::getCurrencies(false, true, true)),
                        'id' => 'id_currency',
                        'name' => 'name',
                    ),
                ),
                array(
                    'type' => 'select',
                    'label' => $this->trans('Country', array(), 'Admin.Global'),
                    'name' => 'id_country',
                    'options' => array(
                        'query' => array_merge(array(0 => array('id_country' => 0, 'name' => $this->trans('All countries', array(), 'Admin.Global'))), Country::getCountries((int) $this->context->language->id)),
                        'id' => 'id_country',
                        'name' => 'name',
                    ),
                ),
                array(
                    'type' => 'select',
                    'label' => $this->trans('Group', array(), 'Admin.Global'),
                    'name' => 'id_group',
                    'options' => array(
                        'query' => array_merge(array(0 => array('id_group' => 0, 'name' => $this->trans('All groups', array(), 'Admin.Global'))), Group::getGroups((int) $this->context->language->id)),
                        'id' => 'id_group',
                        'name' => 'name',
                    ),
                ),
                array(
                    'type' => 'text',
                    'label' => $this->trans('From quantity', array(), 'Admin.Catalog.Feature'),
                    'name' => 'from_quantity',
                    'maxlength' => 10,
                    'required' => true,
                ),
                array(
                    'type' => 'text',
                    'label' => $this->trans('Price (tax excl.)', array(), 'Admin.Catalog.Feature'),
                    'name' => 'price',
                    'disabled' => ($this->object->price == -1 ? 1 : 0),
                    'maxlength' => 10,
                    'suffix' => $this->context->currency->getSign('right'),
                ),
                array(
                    'type' => 'checkbox',
                    'name' => 'leave_bprice',
                    'values' => array(
                        'query' => array(
                            array(
                                'id' => 'on',
                                'name' => $this->trans('Leave initial price', array(), 'Admin.Catalog.Feature'),
                                'val' => '1',
                                'checked' => '1',
                            ),
                        ),
                        'id' => 'id',
                        'name' => 'name',
                    ),
                ),
                array(
                    'type' => 'datetime',
                    'label' => $this->trans('From', array(), 'Admin.Global'),
                    'name' => 'from',
                ),
                array(
                    'type' => 'datetime',
                    'label' => $this->trans('To', array(), 'Admin.Global'),
                    'name' => 'to',
                ),
                array(
                    'type' => 'select',
                    'label' => $this->trans('Reduction type', array(), 'Admin.Catalog.Feature'),
                    'name' => 'reduction_type',
                    'options' => array(
                        'query' => array(array('reduction_type' => 'amount', 'name' => $this->trans('Amount', array(), 'Admin.Global')), array('reduction_type' => 'percentage', 'name' => $this->trans('Percentage', array(), 'Admin.Global'))),
                        'id' => 'reduction_type',
                        'name' => 'name',
                    ),
                ),
                array(
                    'type' => 'select',
                    'label' => $this->trans('Reduction with or without taxes', array(), 'Admin.Catalog.Feature'),
                    'name' => 'reduction_tax',
                    'align' => 'center',
                    'options' => array(
                        'query' => array(
                            array('lab' => $this->trans('Tax included', array(), 'Admin.Global'), 'val' => 1),
                            array('lab' => $this->trans('Tax excluded', array(), 'Admin.Global'), 'val' => 0),
                        ),
                        'id' => 'val',
                        'name' => 'lab',
                    ),
                ),
                array(
                    'type' => 'text',
                    'label' => $this->trans('Reduction', array(), 'Admin.Catalog.Feature'),
                    'name' => 'reduction',
                    'required' => true,
                ),
            ),
            'submit' => array(
                'title' => $this->trans('Save', array(), 'Admin.Actions'),
            ),
        );
        if (($value = $this->getFieldValue($this->object, 'price')) != -1) {
            $price = number_format($value, 6);
        } else {
            $price = '';
        }

        $this->fields_value = array(
            'price' => $price,
            'from_quantity' => (($value = $this->getFieldValue($this->object, 'from_quantity')) ? $value : 1),
            'reduction' => number_format((($value = $this->getFieldValue($this->object, 'reduction')) ? $value : 0), 6),
            'leave_bprice_on' => $price ? 0 : 1,
            'shop_id' => (($value = $this->getFieldValue($this->object, 'id_shop')) ? $value : 1),
        );

        $attribute_groups = array();
        $attributes = Attribute::getAttributes((int) $this->context->language->id);
        foreach ($attributes as $attribute) {
            if (!isset($attribute_groups[$attribute['id_attribute_group']])) {
                $attribute_groups[$attribute['id_attribute_group']] = array(
                    'id_attribute_group' => $attribute['id_attribute_group'],
                    'name' => $attribute['attribute_group'],
                );
            }
            $attribute_groups[$attribute['id_attribute_group']]['attributes'][] = array(
                'id_attribute' => $attribute['id_attribute'],
                'name' => $attribute['name'],
            );
        }
        $features = Feature::getFeatures((int) $this->context->language->id);
        foreach ($features as &$feature) {
            $feature['values'] = FeatureValue::getFeatureValuesWithLang((int) $this->context->language->id, $feature['id_feature'], true);
        }

        $this->tpl_form_vars = array(
            'manufacturers' => Manufacturer::getManufacturers(false, (int) $this->context->language->id, true, false, false, false, true),
            'suppliers' => Supplier::getSuppliers(),
            'attributes_group' => $attribute_groups,
            'features' => $features,
            'categories' => Category::getSimpleCategories((int) $this->context->language->id),
            'conditions' => $this->object->getConditions(),
            'is_multishop' => Shop::isFeatureActive(),
        );

        return parent::renderForm();
    }

    public function processSave()
    {
        $_POST['price'] = Tools::getValue('leave_bprice_on') ? '-1' : Tools::getValue('price');
        if (Validate::isLoadedObject(($object = parent::processSave()))) {
            /* @var SpecificPriceRule $object */
            $object->deleteConditions();
            foreach ($_POST as $key => $values) {
                if (preg_match('/^condition_group_([0-9]+)$/Ui', $key, $condition_group)) {
                    $conditions = array();
                    foreach ($values as $value) {
                        $condition = explode('_', $value);
                        $conditions[] = array('type' => $condition[0], 'value' => $condition[1]);
                    }
                    $object->addConditions($conditions);
                }
            }
            $object->apply();

            return $object;
        }
    }

    public function postProcess()
    {
        Tools::clearSmartyCache();

        return parent::postProcess();
    }
}
