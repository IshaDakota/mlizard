<?php
/**
 * @file
 * Garmentbox profile.
 */

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function mlizard_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = 'Marching Lizard';
}

/**
 * Implements hook_install_tasks().
 */
function mlizard_install_tasks() {
  $tasks = array();

  $tasks['mlizard_set_variables'] = array(
    'display_name' => st('Set Variables'),
    'display' => FALSE,
  );

  return $tasks;
}

/**
 * Task callback; Set variables.
 */
function mlizard_set_variables() {
  $variables = array(
    // Mime-mail.
    'mimemail_format' => 'full_html',
    'mimemail_sitestyle' => FALSE,
    'mimemail_name' => 'Marching Lizard',
    'mimemail_mail' => 'info@marchinglizard.net',
    // Theme default.
    'theme_default' => 'mlizard_bootstrap',
    // jQuery versions.
    'jquery_update_jquery_version' => '1.10',
    'jquery_update_jquery_admin_version' => '1.10',
    // Set frontpage.
    'site_frontpage' => 'home',
    // Enable contact us page manager.
    'page_manager_contact_site_disabled' => FALSE,
    // Enable term page manager.
    'page_manager_term_view_disabled' => FALSE,
    // Private files dir.
    'file_private_path' => 'sites/default/files/private',
  );

  foreach ($variables as $key => $value) {
    variable_set($key, $value);
  }
}

