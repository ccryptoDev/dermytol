<?php
if (!defined('_PS_VERSION_')) {
    exit;
}


class GoogleTag extends Module 
{
    
public function __construct()
{
    $this->name = 'googletag';
    $this->version = '0.0.1';
    $this->author = 'Jack Pulgas London (mi perro)';
    $this->need_instance = 0;
    $this->bootstrap = true;
    parent::__construct();

    $this->displayName = $this->trans('Google Tag Manager', array(), 'Modules.Googletag.Admin');
    $this->description = $this->trans('Integrar Google Tag Manager.', array(), 'Modules.Googletag.Admin');
    $this->ps_versions_compliancy = array('min' => '1.7.1.0', 'max' => _PS_VERSION_);

   
    }
    
   public function install()
    {
        return (parent::install() &&
            $this->registerHook('displayHeader') &&
            $this->registerHook('displayAfterBodyOpeningTag'));
    }
    
          
     public function hookDisplayHeader($params)
	{	
		return $this->display(__FILE__, 'googletag_header.tpl');
	}
        
     public function hookDisplayAfterBodyOpeningTag($params)
	{
		
	return $this->display(__FILE__, 'googletag_body.tpl');
	}
        
        
       public function getContent()
    {
        return $this->display(__FILE__, 'views/templates/admin/template.tpl');
    }
   
    }
    
    