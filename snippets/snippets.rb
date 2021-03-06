require 'ruble'

snippet 'File Head' do |snip|
	snip.trigger = 'nvhead'
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
	snip.trigger = 'nvphpadm'
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
	snip.trigger = 'nvphpmod'
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
	snip.trigger = 'nvlang'
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

#---------------------------------------- Query Fetch Assoc ------------------------------------------------

snippet 'Query Fetch Assoc' do |snip|
	snip.trigger = 'nvsqlfetchassoc'
	snip.expansion = '\$sql = "SELECT SQL_CALC_FOUND_ROWS * FROM \`" . NV_PREFIXLANG . "_" . \$module_data . "\` WHERE \`status\`=1 ORDER BY `id` DESC LIMIT 0, " . \$per_page;
\$_query = \$db->sql_query( \$sql );

\$result_all = \$db->sql_query( "SELECT FOUND_ROWS()" );
list( \$all_page ) =\$db->sql_fetchrow( \$result_all );

while( \$row = \$db->sql_fetch_assoc( \$_query ) )
{
	\/\/\$id = \$row[\'id\'];
}
'
end

#---------------------------------------- Query Fetch Num ------------------------------------------------

snippet 'Query Fetch Num' do |snip|
	snip.trigger = 'nvsqlfetchnum'
	snip.expansion = '\$sql = "SELECT SQL_CALC_FOUND_ROWS \`id\`, \`title\` FROM \`" . NV_PREFIXLANG . "_" . \$module_data . "\` WHERE \`status\`=1 ORDER BY `id` DESC LIMIT 0, " . \$per_page;
\$_query = \$db->sql_query( \$sql );

\$result_all = \$db->sql_query( "SELECT FOUND_ROWS()" );
list( \$all_page ) =\$db->sql_fetchrow( \$result_all );

while( list(\$id, \$title) = \$db->sql_fetchrow( \$_query, 1 ) )
{
	${1:\/\/ Code}
}
'
end

#---------------------------------------- Query Max Weight ------------------------------------------------

snippet 'Query Max Weight' do |snip|
	snip.trigger = 'nvsqlmaxweight'
	snip.expansion = '\$_sql = "SELECT max(\`weight\`) FROM \`" . NV_PREFIXLANG . "_" . \$module_data . "\` WHERE \`catid\`= " . \$catid;
list( \$weight ) = \$db->sql_fetchrow( \$db->sql_query( \$_sql ) );
\$weight = intval( \$weight ) + 1;
'
end

#---------------------------------------- Upload File ------------------------------------------------

snippet 'Upload File' do |snip|
	snip.trigger = 'nvupfile'
	snip.expansion = '\/\/ Upload File
require_once ( NV_ROOTDIR . "/includes/class/upload.class.php" );
\$_upload = new upload( \$allow_files_type, \$global_config[\'forbid_extensions\'], \$global_config[\'forbid_mimes\'], NV_UPLOAD_MAX_FILESIZE, NV_MAX_WIDTH, NV_MAX_HEIGHT );

\$upload_info = \$_upload->save_file( \$_FILES[\'upload\'], NV_ROOTDIR . \'/\' . \$path, false );
if( ! empty( \$upload_info[\'error\'] ) )
{
	\$error = \$upload_info[\'error\'];
}
else
{
	\$filename = \$upload_info[\'name\'];
}
'
end

#---------------------------------------- Upload UrlFile ------------------------------------------------

snippet 'Upload UrlFile' do |snip|
	snip.trigger = 'nvupurl'
	snip.expansion = '\/\/ Upload UrlFile
require_once ( NV_ROOTDIR . "/includes/class/upload.class.php" );
\$_upload = new upload( \$allow_files_type, \$global_config[\'forbid_extensions\'], \$global_config[\'forbid_mimes\'], NV_UPLOAD_MAX_FILESIZE, NV_MAX_WIDTH, NV_MAX_HEIGHT );

\$urlfile = trim( \$nv_Request->get_string( \'fileurl\', \'post\' ) );
\$upload_info = \$_upload->save_urlfile( \$urlfile, NV_ROOTDIR . \'/\' . \$path, false );

if( ! empty( \$upload_info[\'error\'] ) )
{
	\$error = \$upload_info[\'error\'];
}
else
{
	\$filename = \$upload_info[\'name\'];
}
'
end

#---------------------------------------- Download File ------------------------------------------------

snippet 'Download File' do |snip|
	snip.trigger = 'nvdownfile'
	snip.expansion = '\/\/ Download file
require_once ( NV_ROOTDIR . "/includes/class/download.class.php" );
\$_download = new download( \$file_src, \$directory, \$file_basename, \$is_resume, \$max_speed );
\$_download->download_file();
exit();
'
end

#---------------------------------------- Image Resize ------------------------------------------------

snippet 'Image Resize' do |snip|
	snip.trigger = 'nvimgresize'
	snip.expansion = '\/\/ Image Resize
require_once ( NV_ROOTDIR . "/includes/class/image.class.php" );
\$_image = new image( \$pathimage, NV_MAX_WIDTH, NV_MAX_HEIGHT );
\$_image->resizeXY( \$width, \$height );
\$_image->save( NV_ROOTDIR . \'/\' . NV_TEMP_DIR, \$basename );
\$_image->close();
'
end

#---------------------------------------- Xtpl Begin End ------------------------------------------------

snippet 'Tpl Begin End' do |snip|
	snip.trigger = 'tplblock'
	snip.expansion = '<!-- BEGIN: ${1:main} -->
	${2}
<!-- END: ${1:main} -->'
end

#---------------------------------------- Tpl Form Submit ------------------------------------------------

snippet 'Tpl Form Submit' do |snip|
	snip.trigger = 'tplform'
	snip.expansion = '<form action="{NV_BASE_ADMINURL}index.php?{NV_NAME_VARIABLE}={MODULE_NAME}&{NV_OP_VARIABLE}={OP}" method="post">
	<input type="hidden" name="save"  value="1" />
	<input type="hidden" name="id" value="{DATA.id}" />
	<table class="tab1">
		<tbody>
			<tr>
				<td><strong>{LANG.title}</strong></td>
				<td><input type="text" value="{DATA.title}" name="title" maxlength="255" /></td>
			</tr>
		</tbody>
		<tbody class="second">
			<tr>
				<td><strong>{LANG.alias}</strong></td>
				<td><input type="text" value="{DATA.alias}" name="alias" id="idalias" maxlength="255" /><img src="{NV_BASE_SITEURL}images/refresh.png" width="16" class="refresh" onclick="get_alias(\'{DATA.id}\');" alt="Get alias..." height="16" /></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="center"><input name="submit" type="submit" value="{LANG.save}" /></td>
			</tr>
		</tfoot>
	</table>
</form>'
end

#---------------------------------------- Tpl Table ------------------------------------------------

snippet 'Tpl Table' do |snip|
	snip.trigger = 'tpltable'
	snip.expansion = '<table class="tab1">
	<thead>
		<tr>
			<td>{LANG.id}</td>
			<td>{LANG.title}</td>
		</tr>
	</thead>
	<!-- BEGIN: loop -->
	<tbody>
		<tr>
			<td>{DATA.id}</td>
			<td>{DATA.title}</td>
		</tr>
	</tbody>
	<!-- END: loop -->
	<!-- BEGIN: page -->
	<tfoot>
		<tr>
			<td colspan="2" align="center">{GENERATE_PAGE}</td>
		</tr>
	</tfoot>
	<!-- END: page -->
</table>'
end

#---------------------------------------- Block Module.ini ------------------------------------------------

snippet 'Block Module.ini' do |snip|
	snip.trigger = 'blockini'
	snip.expansion = '<?xml version="1.0" encoding="utf-8"?>
<block>
	<info>
		<name>${1:Block Name}</name>
		<author>${2:Block Author}</author>
		<website>${3:http:\/\/nukeviet.vn}</website>
		<description>${4}</description>
	</info>
	<config>
		<title_length>22</title_length>
	</config>
	<datafunction>nv_block_config_${5:module_name}_${6:blockname}</datafunction>
	<submitfunction>nv_block_config_${5:module_name}_${6:blockname}_submit</submitfunction>
</block>'
end

#---------------------------------------- Block Module.php ------------------------------------------------

snippet 'Block Module.php' do |snip|
	snip.trigger = 'blockphp'
	snip.expansion = snip.expansion = '<?php

/**
 * @Project NUKEVIET 3.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) '+Time.now.gmtime.strftime('%Y')+' VINADES.,JSC. All rights reserved
 * @Createdate '+Time.now.gmtime.strftime('%a, %d %b %Y %I:%M:%S')+' GMT
 */

if( ! defined( \'NV_MAINFILE\' ) ) die( \'Stop!!!\' );

if( ! nv_function_exists( \'nv_block_${1:module_name}_${2:blockname}\' ) )
{
	function nv_block_${1:module_name}_${2:blockname}( \$block_config )
	{
		global \$module_info;
		\$title_length = \$block_config[\'title_length\'];

		\$xtpl = new XTemplate( \'block_${1:module_name}_${2:blockname}.tpl\', NV_ROOTDIR . \'\/themes\/\' . \$module_info[\'template\'] . \'\/modules/${1:module_name}\' );
		\$xtpl->assign( \'TEMPLATE\', \$module_info[\'template\'] );
		${3}
		\$xtpl->parse( \'main\' );
		return \$xtpl->text( \'main\' );
	}

	function nv_block_config_${1:module_name}_${2:blockname}( \$module, \$data_block, \$lang_block )
	{
		\$html = "<tr>";
		\$html .= "	<td>" . \$lang_block[\'title_length\'] . "</td>";
		\$html .= "	<td><input type=\"text\" name=\"config_title_length\" size=\"5\" value=\"" . \$data_block[\'title_length\'] . "\" /></td>";
		\$html .= "</tr>";

		return \$html;
	}

	function nv_block_config_${1:module_name}_${2:blockname}_submit( \$module, \$lang_block )
	{
		global \$nv_Request;
		\$return = array();
		\$return[\'error\'] = array();
		\$return[\'config\'] = array();
		\$return[\'config\'][\'title_length\'] = \$nv_Request->get_int( \'config_title_length\', \'post\', 0 );
		return \$return;
	}
}

if( defined( \'NV_SYSTEM\' ) )
{
	global \$site_mods, \$module_name;
	if( isset( \$site_mods[\$block_config[\'module\']] ) )
	{
		\$content = nv_block_${1:module_name}_${2:blockname}( \$block_config );
	}
}

?>'
end

#---------------------------------------- News Snippet ------------------------------------------------

# Use Commands > Bundle Development > Insert Bundle Section > Snippet
# to easily add new snippets