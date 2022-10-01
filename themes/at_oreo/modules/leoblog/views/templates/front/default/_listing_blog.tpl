{*
 *  Leo Prestashop SliderShow for Prestashop 1.6.x
 *
 * @package   leosliderlayer
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
*}

<article class="blog-item">
	<div class="blog-image-container">
		{if $config->get('listing_show_title','1')}
			<h4 class="title">
				<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}">{$blog.title|escape:'html':'UTF-8'}</a>
			</h4>
		{/if}
		<div class="blog-meta">
			{if $config->get('listing_show_author','1')&&!empty($blog.author)}
				<span class="blog-author">
					<i class="icon-font icon-user"></i> <span>{l s='Posted By' mod='leoblog'}:</span> 
					<a href="{$blog.author_link|escape:'html':'UTF-8'}" title="{$blog.author|escape:'html':'UTF-8'}">{$blog.author|escape:'html':'UTF-8'}</a> 
				</span>
			{/if}
			
			{if $config->get('listing_show_category','1')}
				<span class="blog-cat"> 
					<i class="icon-list icons"></i> <span>{l s='In' mod='leoblog'}:</span> 
					<a href="{$blog.category_link|escape:'html':'UTF-8'}" title="{$blog.category_title|escape:'html':'UTF-8'}">{$blog.category_title|escape:'html':'UTF-8'}</a>
				</span>
			{/if}
			
			{if $config->get('listing_show_created','1')}
				<span class="blog-created">
					<i class="icon-font icon-calendar"></i>
					<time class="date" datetime="{strtotime($blog.date_add)|date_format:"%Y"|escape:'html':'UTF-8'}">	
						{*					
						{assign var='blog_date' value=strtotime($blog.date_add)|date_format:"%a"}
						{l s=$blog_date mod='leoblog'},	<!-- day of week -->
						*}
						{assign var='blog_month' value=strtotime($blog.date_add)|date_format:"%b"}
						{l s=$blog_month mod='leoblog'}		<!-- month-->			
						{assign var='blog_day' value=strtotime($blog.date_add)|date_format:"%e"}	
						{l s=$blog_day mod='leoblog'} <!-- day of month -->	
						{assign var='blog_year' value=strtotime($blog.date_add)|date_format:"%Y"}		
						{l s=$blog_year mod='leoblog'}	<!-- year -->
					</time>
				</span>
			{/if}
			
			{if isset($blog.comment_count)&&$config->get('listing_show_counter','1')}	
				<span class="blog-ctncomment">
					<i class="icon-speech icons"></i> <span>{l s='Comment' mod='leoblog'}:</span> 
					{$blog.comment_count|intval}
				</span>
			{/if}

			{if $config->get('listing_show_hit','1')}	
				<span class="blog-hit">
					<i class="icon-heart icons"></i> <span>{l s='Hit' mod='leoblog'}:</span> 
					{$blog.hits|intval}
				</span>
			{/if}
		</div>
		{if $blog.image && $config->get('listing_show_image',1)}
		<div class="blog-image">
			<img src="{$blog.preview_url|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" alt="" class="img-fluid" />
		</div>
		{/if}
	</div>
	<div class="blog-info">
		{if $config->get('listing_show_description','1')}
			<div class="blog-shortinfo">
				{$blog.description|strip_tags:'UTF-8'|truncate:160:'...' nofilter}{* HTML form , no escape necessary *}
			</div>
		{/if}
		{if $config->get('listing_show_readmore',1)}
			<p>
				<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" class="more btn btn-primary">{l s='Read more' mod='leoblog'}</a>
			</p>
		{/if}
	</div>
	
	<div class="hidden-xl-down hidden-xl-up datetime-translate">
		{l s='Sunday' mod='leoblog'}
		{l s='Monday' mod='leoblog'}
		{l s='Tuesday' mod='leoblog'}
		{l s='Wednesday' mod='leoblog'}
		{l s='Thursday' mod='leoblog'}
		{l s='Friday' mod='leoblog'}
		{l s='Saturday' mod='leoblog'}
		
		{l s='January' mod='leoblog'}
		{l s='February' mod='leoblog'}
		{l s='March' mod='leoblog'}
		{l s='April' mod='leoblog'}
		{l s='May' mod='leoblog'}
		{l s='June' mod='leoblog'}
		{l s='July' mod='leoblog'}
		{l s='August' mod='leoblog'}
		{l s='September' mod='leoblog'}
		{l s='October' mod='leoblog'}
		{l s='November' mod='leoblog'}
		{l s='December' mod='leoblog'}
					
	</div>
</article>
