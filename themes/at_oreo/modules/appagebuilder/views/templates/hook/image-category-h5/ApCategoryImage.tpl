{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApCategoryImage -->
{function name=apmenu level=0}
<div class="item">
<ul class="level{$level|intval} {if $level == 0} ul-{$random|escape:'html':'UTF-8'}{/if}">
{foreach $data as $category}
	{if isset($category.children) && is_array($category.children)}
	<li class="cate_{$category.id_category|intval}" >
		<span class="cover-img">
			{if isset($category.image)}
			
			<a href="{$link->getCategoryLink($category.id_category, $category.link_rewrite)|escape:'html':'UTF-8'}">
				<img class="img-fluid" src='{$category["image"]|escape:'html':'UTF-8'}' alt='{$category["name"]|escape:'html':'UTF-8'}' 
				 {if $formAtts.showicons == 0 || ($level gt 0 && $formAtts.showicons == 2)} style="display:none"{/if}/>
			</a>
			{/if}
		</span>
		<div class="item-product-cat-content">
			<div class="item-icon"></div>
			<div class="item-title">
				<a href="{$link->getCategoryLink($category.id_category, $category.link_rewrite)|escape:'html':'UTF-8'}">
					{$category.name|escape:'html':'UTF-8'}
				</a>
			</div>
		</div>
		{apmenu data=$category.children level=$level+1}
	</li>
	{else}
	<li class="cate_{$category.id_category|intval}">
		<span class="cover-img">
			{if isset($category.image)}
			<a href="{$link->getCategoryLink($category.id_category, $category.link_rewrite)|escape:'html':'UTF-8'}">
				<img class="img-fluid" src='{$category["image"]|escape:'html':'UTF-8'}' alt='{$category["name"]|escape:'html':'UTF-8'}' 
				 {if $formAtts.showicons == 0 || ($level gt 0 && $formAtts.showicons == 2)} style="display:none"{/if}/>
			</a>
			{/if}
		</span>
		<div class="item-product-cat-content">
			<div class="item-icon"></div>
			<div class="item-title">
				<a href="{$link->getCategoryLink($category.id_category, $category.link_rewrite)|escape:'html':'UTF-8'}">
					{$category.name|escape:'html':'UTF-8'}
				</a>
			</div>
		</div>
	</li>
	{/if}
{/foreach}
</ul>
</div>
{/function}

{if isset($categories)}
<div class="widget-category_image block {if isset($formAtts.class)}{$formAtts.class|escape:'html':'UTF-8'}{/if}">
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
	{if isset($formAtts.title) && !empty($formAtts.title)}
	<h4 class="title_block">
		{$formAtts.title|escape:'html':'UTF-8'}
	</h4>
	{/if}
    {if isset($formAtts.sub_title) && $formAtts.sub_title}
        <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
    {/if}
	<div class="block_content">
		<div class="owl-row">
			<div id="category_image" class="owl-carousel owl-theme owl-loading">
				{foreach from = $categories key=key item =cate}
					{apmenu data=$cate}
				{/foreach}
			</div>
		</div>
		<div id="view_all_wapper_{$random|escape:'html':'UTF-8'}" class="view_all_wapper hide">
			<a class="btn btn-primary view_all" href="javascript:void(0)">{l s='View all' d='Shop.Theme.Global'}</a>
		</div> 
	</div>
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
</div>
{/if}
<script type="text/javascript">
{literal} 
	ap_list_functions.push(function(){
		$(".view_all_wapper").hide();
		var limit = {/literal}{$formAtts.limit|intval}{literal};
		var level = {/literal}{$formAtts.cate_depth|intval}{literal} - 1;
		$("ul.ul-{/literal}{$random|escape:'html':'UTF-8'}, ul.ul-{$random|escape:'html':'UTF-8'} ul"{literal}).each(function(){
			var element = $(this).find(">li").length;
			var count = 0;
			$(this).find(">li").each(function(){
				count = count + 1;
				if(count > limit){
					// $(this).remove();
					$(this).hide();
				}
			});
			if(element > limit) {
				view = $(".view_all","#view_all_wapper_{/literal}{$random|escape:'html':'UTF-8'}"){literal}.clone(1);
				// view.appendTo($(this).find("ul.level" + level));
				view.appendTo($(this));
				var href = $(this).closest("li").find('a:first-child').attr('href');
				$(view).attr("href", href);
			}
		})
	});
{/literal}

	products_list_functions.push(
	    function(){
	      $('#category_image').owlCarousel({
	        {if isset($IS_RTL) && $IS_RTL}
	          direction:'rtl',
	        {else}
	          direction:'ltr',
	        {/if}
	        items : 7,
	        itemsCustom : false,
	        itemsDesktop : [1200, 6],
	        itemsDesktopSmall : [992, 4],
	        itemsTablet : [768, 4],
	        itemsTabletSmall : [600,3],
	        itemsMobile : [480, 2],
	        singleItem : false,         // true : show only 1 item
	        itemsScaleUp : false,
	        slideSpeed : 200,  //  change speed when drag and drop a item
	        paginationSpeed :800, // change speed when go next page

	        autoPlay : false,   // time to show each item
	        stopOnHover : false,
	        navigation : true,
	        navigationText : ["&lsaquo;", "&rsaquo;"],

	        scrollPerPage :true,
	        responsive :true,
	        
	        pagination : false,
	        paginationNumbers : false,
	        
	        addClassActive : true,
	        
	        mouseDrag : true,
	        touchDrag : true,
			afterInit: OwlLoaded,
	      });
	    }
	);
function OwlLoaded(el){
    el.removeClass('owl-loading').addClass('owl-loaded').parents('.owl-row').addClass('hide-loading');
};
</script>