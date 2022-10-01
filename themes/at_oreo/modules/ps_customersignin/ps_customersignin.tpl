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
<div class="userinfo-selector links dropdown js-dropdown popup-over">
  <a href="javascript:void(0)" data-toggle="dropdown" class="popup-title" title="{l s='Account' d='Shop.Theme.Global'}">
    <i>
      <svg version="1.1" aria-hidden="true" focusable="false" role="presentation" viewBox="0 0 485.211 485.21" class="icon icon-u"><g><path d="M394.235,333.585h-30.327c-33.495,0-60.653-27.158-60.653-60.654v-19.484c13.418-15.948,23.042-34.812,29.024-54.745c0.621-3.36,3.855-5.02,6.012-7.33c11.611-11.609,13.894-31.2,5.185-45.149c-1.186-2.117-3.322-3.953-3.201-6.576c0-17.784,0.089-35.596-0.023-53.366c-0.476-21.455-6.608-43.773-21.65-59.66c-12.144-12.836-28.819-20.479-46.022-23.75c-21.739-4.147-44.482-3.937-66.013,1.54c-18.659,4.709-36.189,15.637-47.028,31.836c-9.598,14.083-13.803,31.183-14.513,48.036c-0.266,18.094-0.061,36.233-0.116,54.371c0.413,3.631-2.667,6.088-4.058,9.094c-8.203,14.881-4.592,35.155,8.589,45.978c3.344,2.308,3.97,6.515,5.181,10.142c5.748,17.917,15.282,34.487,27.335,48.925v20.138c0,33.496-27.157,60.654-60.651,60.654H90.978c0,0-54.964,15.158-90.978,90.975v30.327c0,16.759,13.564,30.321,30.327,30.321h424.562c16.759,0,30.322-13.562,30.322-30.321V424.56C449.199,348.749,394.235,333.585,394.235,333.585z"></path></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
    </i>
 </a>
  <ul class="popup-content dropdown-menu user-info">
    {if $logged}
      <li>
        <a
          class="account dropdown-item" 
          href="{$my_account_url}"
          title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
          rel="nofollow"
        >
          <span>{l s='Hello' d='Shop.Theme.Global'} {$customerName}</span>
        </a>
      </li>
      <li>
        <a
          class="logout dropdown-item"
          href="{$logout_url}"
          rel="nofollow"
        >
          {l s='Sign out' d='Shop.Theme.Actions'}
        </a>
      </li>
    {else}
      <li>
        <a
          class="signin  leo-quicklogin"
          data-enable-sociallogin="enable"
          data-type="popup"
          data-layout="login"
          href="javascript:void(0)"
          title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
          rel="nofollow"
        >
          <span>{l s='Sign in' d='Shop.Theme.Actions'}</span>
        </a>
      </li>
    {/if}
    {*
    <li>
      <a
        class="myacount dropdown-item"
        href="{$my_account_url}"
        title="{l s='My account' d='Shop.Theme.Global'}"
        rel="nofollow"
      >
        <span>{l s='My account' d='Shop.Theme.Global'}</span>
      </a>
    </li>
    *} 

{if Configuration::get('LEOFEATURE_ENABLE_PRODUCTWISHLIST')}
      <li>
        <a
          class="ap-btn-wishlist dropdown-item"
          href="{url entity='module' name='leofeature' controller='mywishlist'}"
          title="{l s='Wishlist' d='Shop.Theme.Global'}"
          rel="nofollow"
        >
          <span>{l s='Wishlist' d='Shop.Theme.Global'}</span>
      (<span class="ap-total-wishlist ap-total"></span>)
        </a>
      </li>
{/if}
{if Configuration::get('LEOFEATURE_ENABLE_PRODUCTCOMPARE')}
	<li>
      <a
        class="ap-btn-compare dropdown-item"
        href="{url entity='module' name='leofeature' controller='productscompare'}"
        title="{l s='Compare' d='Shop.Theme.Global'}"
        rel="nofollow"
      >
        <span>{l s='Compare' d='Shop.Theme.Global'}</span>
		(<span class="ap-total-compare ap-total"></span>)
      </a>
    </li>
	{/if}
    <li>
      <a
        class="checkout dropdown-item"
        href="{url entity='cart' params=['action' => show]}"
        title="{l s='Checkout' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <span>{l s='Checkout' d='Shop.Theme.Actions'}</span>
      </a>
    </li>
  </ul>
</div>