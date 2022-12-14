{**
 *  PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright  PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div class="block_newsletter block">
  <h3 class="title_block" id="block-newsletter-label">{l s='Newsletter signup' d='Shop.Theme.Actions'}</h3>
  <div class="block_content">
    <form action="{$urls.pages.index}#footer" method="post">
      <div class="row">
        <div class="col-xs-12 col-conditions">
            {if $conditions}
              <p>{$conditions}</p>
            {/if}
            {if $msg}
              <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
                {$msg}
              </p>
            {/if}
              {if isset($id_module)}
                {hook h='displayGDPRConsent' id_module=$id_module}
              {/if}
        </div>
        <div class="col-xs-12 col-form">
          <div class="input-wrapper">
            <input
              name="email"
              type="text"
              value="{$value}"
              placeholder="{l s='Your email...' d='Shop.Forms.Labels'}"
              aria-labelledby="block-newsletter-label"
            >
            <button
              class="btn btn-outline float-xs-right"
              name="submitNewsletter"
              type="submit"
              value="{l s='Subscribe' d='Shop.Theme.Actions'}"
            >
              <i class="fa fa-envelope"></i><span>{l s='Subscribe' d='Shop.Theme.Actions'}</span>
            </button>
          </div>
          <input type="hidden" name="action" value="0">
          <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-notice">
          <p><span>*</span>{l s="don't worry we don't spam" d='Shop.Theme.Actions'}</p>
        </div>
      </div>
    </form>
  </div>
</div>
