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
<div id="cart-block">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header">
      {if $cart.products_count > 0}
        <a rel="nofollow" href="{$cart_url}">
      {/if}
        {* <i>
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 279 279" style="enable-background:new 0 0 279 279;" xml:space="preserve"><path d="M222.333,66H179.5V39.67C179.5,17.521,161.812,0,139.663,0h-0.66C116.854,0,98.5,17.521,98.5,39.67V66H57.333c-4.142,0-7.833,3.358-7.833,7.5v198c0,4.142,3.691,7.5,7.833,7.5h165c4.142,0,7.167-3.358,7.167-7.5v-198C229.5,69.358,226.475,66,222.333,66z M113.5,39.67c0-13.879,11.624-24.67,25.503-24.67h0.66c13.879,0,24.837,10.791,24.837,24.67V66h-51V39.67z"></path><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
        </i> *}
        <img src="{_THEME_DIR_}assets/img/basket.jpg" />
        {*
        <span class="cart-text">{l s='Cart' d='Shop.Theme.Checkout'}</span>
        *}
        <span class="cart-products-count">{$cart.products_count}</span>
      {if $cart.products_count > 0}
        </a>
      {/if}
    </div>
  </div>
</div>
