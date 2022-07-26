cd drupal
composer require drupal/gutenberg
composer require drupal/feeds:3.x-dev
composer require drupal/tamper:1.x-dev
composer require drupal/feeds_tamper:2.x-dev
composer require drupal/cdn
composer require drupal/stage_file_proxy
composer require drupal/fontawesome
composer require drupal/advagg
composer require drupal/media_library_theme_reset
composer require drupal/field_group
composer require drupal/layout_builder_admin_theme
composer require drupal/webform
composer require drupal/views_taxonomy_term_name_depth
composer require drupal/views_fieldsets
composer require oomphinc/composer-installers-extender
composer require npm-asset/jquery-ui-touch-punch
composer require drupal/jquery_ui_touch_punch
composer require npm-asset/jquery-ui-touch-punch
composer require drupal/better_exposed_filters
composer require drupal/metatag
composer require drupal/token
composer require drupal/scheduler:2.x-dev
composer require drupal/redirect
composer require drupal/pathauto
composer require drupal/media_library_form_element
composer require drupal/libraries:3.x-dev
composer require drupal/extra_css_js
composer require drupal/addtocal:2.x-dev
composer require drupal/svg_image
composer require drupal/image_widget_crop
composer require drupal/focal_point
composer require drupal/crop
composer require drupal/layout_builder_base:1.x-dev
composer require drupal/layout_builder_styles:1.x-dev
composer require drupal/config_filter
composer require drupal/config_split:2.0.x-dev
composer require drupal/gutenberg_bs_blocks:1.0.0-rc1
composer require drupal/address
composer require drupal/react_webform_backend:^1.0@beta
composer require drupal/gin_toolbar:1.x-dev
composer require drupal/gin:3.x-dev@dev
composer require drupal/shield
composer require drupal/blazy
composer require drupal/field_inheritance:2.0.x-dev
composer require drupal/gatsby:^2.0@RC
composer require drupal/geolocation
composer require drupal/feeds_ex:^1.0@beta
composer require drupal/recurring_events:2.0.x-dev
composer require drupal/search_api
composer require drupal/slick
composer require drupal/facets
composer require drupal/jsonapi_extras:^3.20
composer require drupal/selective_better_exposed_filters
composer require drupal/views_block_exposed_filter_block
composer require drupal/views_data_export
composer require drupal/views_reference_field
composer require drupal/video_embed_field
composer require drupal/video_embed_media
composer require drupal/recurring_events:^2.0.x-dev
composer require drupal/paragraphs
composer require drupal/layout_paragraphs:^2.0@beta
composer require drupal/entity_usage:^2.0@beta
composer require drupal/component:^1.0@RC
composer require drupal/typed_data:1.x-dev
composer require drupal/graphql:^4.3
composer require drupal/js_component:^2.0@alpha
composer require drupal/cl_components:^1.0@beta
composer require drupal/graphql_export:^1.0@alpha
composer require drupal/decoupled_pages:^1.0
composer require drupal/layoutcomponents:^4.0
composer require drupal/cl_server:^1.0@beta
composer require drupal/sfc:^1.7
composer require drupal/config_ignore:^3.0@beta
composer require drupal/config_filter:^2.4
composer require drupal/config_inspector:^2.0
composer require drupal/config_partial_export:^1.6
composer require drupal/config_merge:^1.0@RC
composer require drupal/config_direct_save:^2.1
composer require drupal/config_actions:^1.3
composer require drupal/config_override:^1.0@RC
composer require drupal/config_export_ignore:^1.1
composer require drupal/content_as_config:^1.0
composer require drupal/config_notify:^1.9
composer require drupal/config_token:^1.3
composer require drupal/config_suite:^2.0
composer require drupal/config_actions_provider:^1.0
composer require drupal/config_update:^1.7
composer require drupal/openy_lily:^1.1
composer require drupal/openy_carnation:^2
composer require drupal/openy_rose:^1.1
composer require drupal/plugin:^2.9
composer require drupal/search_api_solr:^4.2
composer require drupal/media_library_importer:^1.0@beta
composer require drupal/bulk_import_feed_links:^1.0@alpha
composer require drupal/entity_import:^1.0@alpha
composer require drupal/content_csv_export_import:^1.0
composer require drupal/entities_import:^1.2
composer require drupal/contentimport:^9.3
composer require drupal/csv_importer:^1.14
composer require drupal/entity_export_csv:^1.0@beta
composer require drupal/content_export_yaml:^3.2
composer require drupal/default_content:^2.0@alpha
composer require drupal/export_action_for_default_content:^1.0@beta
composer require drupal/views_bulk_operations:^4.1
composer require drupal/static_suite:^1.1@alpha
composer require drupal/graphql_fragment_include:^1.5


cd /var/www/drupal/web/sites/default
chmod 777 -R files

drush cex -y