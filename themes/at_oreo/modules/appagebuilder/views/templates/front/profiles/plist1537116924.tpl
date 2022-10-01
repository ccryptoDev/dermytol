{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
  <div class="thumbnail-container">
    <div class="product-image">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_thumbnail'}

{if $product.cover}
    {if isset($formAtts) && isset($formAtts.lazyload) && $formAtts.lazyload}
        
	<a href="{$product.url}" class="thumbnail product-thumbnail">
	  <img
		class="img-fluid lazyOwl"
		src = ""
		data-src = "{$product.cover.bySize.home_default.url}"
		alt = "{$product.cover.legend}"
		data-full-size-image-url = "{$product.cover.large.url}"
	  >
	  {if isset($cfg_product_one_img) && $cfg_product_one_img}
		<span class="product-additional" data-idproduct="{$product.id_product}"></span>
	  {/if}
	</a> 
    {else}
	<a href="{$product.url}" class="thumbnail product-thumbnail">
	  <img
		class="img-fluid"
		src = "{$product.cover.bySize.home_default.url}"
		alt = "{$product.cover.legend}"
		data-full-size-image-url = "{$product.cover.large.url}"
	  >
	  {if isset($cfg_product_one_img) && $cfg_product_one_img}
		<span class="product-additional" data-idproduct="{$product.id_product}"></span>
	  {/if}
	</a>
    {/if}
{else}
  <a href="{$product.url}" class="thumbnail product-thumbnail leo-noimage">
 <img
   src = "{$urls.no_picture_image.bySize.home_default.url}"
 >
  </a>
{/if}
  
{/block}


{if $product.discount_type === 'percentage'}
  <span class="discount-percentage">{$product.discount_percentage}</span>
{/if}
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
<div class="quickview{if !$product.main_variants} no-variants{/if} hidden-sm-down">
<a
  href="#"
  class="quick-view"
  data-link-action="quickview"
>
	<span class="leo-quickview-bt-loading cssload-speeding-wheel"></span>
	<span class="leo-quickview-bt-content">
		<i class="material-icons search">&#xE8B6;</i>
		<span>{l s='Quick view'}</span>
	</span>
</a>
</div>
</div>
    <div class="product-meta"><div class="pro-info">
<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
	{block name='product_variants'}
	  {if $product.main_variants}
		{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
	  {/if}
	{/block}
  </div></div>
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_name'}
  <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h3>
{/block}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">
			<input type="hidden" name="test4">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="regular-price">{$product.regular_price}</span>
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}
			  <input type="hidden" name="good-price-test" value="{$product.good_price}">
			  
              <span class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <span itemprop="priceCurrency" content="{$currency.iso_code}"></span>
				<span>{l s='A piece' d='Shop.Theme.Global'}</span>&nbsp;&nbsp;
				{* <span>A partir de</span>&nbsp;&nbsp; *}
				
				{if $product.has_good_price == 1}
				<span itemprop="price" content="{$product.good_price}">{$product.good_price}</span>
				{else}
				<span itemprop="price" content="{$product.price_amount}">{$product.price}</span>
				{/if}
              </span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>
          {/if}
        {/block}
<div class="pro-btn">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoCartButton' product=$product}
</div></div>
  </div>
</article>
