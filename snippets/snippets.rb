require 'ruble'

snippet 'File Head' do |snip|
#snip.trigger = 'Content file php News'
  snip.expansion = '
/**
 * @Project NUKEVIET 3.x
 * @Author ${1:VINADES.,JSC} (${2:contact@vinades.vn})
 * @Copyright (C) '+Time.now.gmtime.strftime('%Y')+' ${3:VINADES.,JSC}. All rights reserved
 * @Createdate '+Time.now.gmtime.strftime('%a, %d %b %Y %I:%M:%S')+' GMT
 */
'
end

#-------------------------------------- PHP Module Admin ---------------------------------------------------

snippet 'PHP Module Admin' do |snip|
#snip.trigger = 'Content file php News'
  snip.expansion = '<?php

/**
 * @Project NUKEVIET 3.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) '+Time.now.gmtime.strftime('%Y')+' VINADES.,JSC. All rights reserved
 * @Createdate '+Time.now.gmtime.strftime('%a, %d %b %Y %I:%M:%S')+' GMT
 */

if( ! defined( \'NV_IS_FILE_ADMIN\' ) ) die( \'Stop!!!\' );

${2:\/\/ Code}

\$xtpl = new XTemplate( \$op . ".tpl", NV_ROOTDIR . "/themes/" . \$global_config[\'module_theme\'] . "/modules/" . \$module_file );
\$xtpl->assign( \'LANG\', \$lang_module );
\$xtpl->assign( \'NV_BASE_ADMINURL\', NV_BASE_ADMINURL );
\$xtpl->assign( \'NV_NAME_VARIABLE\', NV_NAME_VARIABLE );
\$xtpl->assign( \'NV_OP_VARIABLE\', NV_OP_VARIABLE );
\$xtpl->assign( \'MODULE_NAME\', \$module_name );
\$xtpl->assign( \'OP\', \$op );

\$xtpl->parse( \'main\' );
\$contents = \$xtpl->text( \'main\' );

\$page_title = \$lang_module[\'${1:page_title}\'];

include (NV_ROOTDIR . "/includes/header.php");
echo nv_admin_theme( \$contents );
include (NV_ROOTDIR . "/includes/footer.php");

?>'
end

#---------------------------------------- PHP Module ------------------------------------------------

snippet 'PHP Module' do |snip|
#snip.trigger = 'Content file php News'
  snip.expansion = '<?php

/**
 * @Project NUKEVIET 3.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) '+Time.now.gmtime.strftime('%Y')+' VINADES.,JSC. All rights reserved
 * @Createdate '+Time.now.gmtime.strftime('%a, %d %b %Y %I:%M:%S')+' GMT
 */

if( ! defined( \'NV_IS_MOD_${1:MODULE_NAME}\' ) ) die( \'Stop!!!\' );

\$page_title = \$module_info[\'custom_title\'];
\$key_words = \$module_info[\'keywords\'];

\$array_data = array();

${3:\/\/ Code}

\$contents = nv_theme_${2:module_name_op}( \$array_data );

include (NV_ROOTDIR . "/includes/header.php");
echo nv_site_theme( \$contents );
include (NV_ROOTDIR . "/includes/footer.php");

?>'
end

#---------------------------------------- PHP Language ------------------------------------------------

snippet 'PHP Language' do |snip|
#snip.trigger = 'Content file php News'
  snip.expansion = '<?php

/**
 * @Project NUKEVIET 3.x
 * @Author ${1:VINADES.,JSC} (${2:contact@vinades.vn})
 * @Copyright (C) '+Time.now.gmtime.strftime('%Y')+' ${3:VINADES.,JSC}. All rights reserved
 * @Createdate '+Time.now.gmtime.strftime('%a, %d %b %Y %I:%M:%S')+' GMT
 */

if( ! defined( \'NV_MAINFILE\' ) ) die( \'Stop!!!\' );

\$lang_translator[\'author\'] = \'${1:VINADES.,JSC} (${2:contact@vinades.vn})\';
\$lang_translator[\'createdate\'] = \''+Time.now.gmtime.strftime('%d/%m/%Y, %I:%M')+'\';
\$lang_translator[\'copyright\'] = \'@Copyright (C) '+Time.now.gmtime.strftime('%Y')+' ${3:VINADES.,JSC}. All rights reserved\';
\$lang_translator[\'info\'] = \'\';
\$lang_translator[\'langtype\'] = \'lang_module\';

\$lang_module[\'main\'] = \'${4}\';
\$lang_module[\'${5}\'] = \'${6}\';

?>'
end

#---------------------------------------- News Snippet ------------------------------------------------

# Use Commands > Bundle Development > Insert Bundle Section > Snippet
# to easily add new snippets