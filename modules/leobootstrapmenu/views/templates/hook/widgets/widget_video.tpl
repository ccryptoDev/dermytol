{* 
* @Module Name: Leo Bootstrap Menu
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
*}

<div class="leo-widget" data-id_widget="{$id_widget}">
{if isset($video_code)}
    <div class="widget-video">
        {if isset($widget_heading)&&!empty($widget_heading)}
        <div class="menu-title">
            {$widget_heading}
        </div>
        {/if}
        <div class="widget-inner">
            {$video_code nofilter}{* HTML form , no escape necessary *}
        </div>
    </div>
{/if}
<div class="w-name">
        <select name="inject_widget" class="inject_widget_name">
            {foreach from=$widgets item=w}
                <option value="{$w['key_widget']}">
                    {$w['name']}
                </option>
            {/foreach}
        </select>
    </div>
</div>