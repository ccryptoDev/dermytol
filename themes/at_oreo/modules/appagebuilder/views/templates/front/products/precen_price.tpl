{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{if $product.discount_type === 'percentage'}
  <span class="discount-percentage">{$product.discount_percentage}</span>
{/if}