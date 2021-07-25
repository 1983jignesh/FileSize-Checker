prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>43401675606244487
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RND'
);
end;
/
 
prompt APPLICATION 125 - RND
--
-- Application Export:
--   Application:     125
--   Name:            RND
--   Date and Time:   10:03 Sunday July 25, 2021
--   Exported By:     JIGNESH
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 531716196086729693
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     204267373216795
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/filesize
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(531716196086729693)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'FILESIZE'
,p_display_name=>'FileSize'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#v_file_size.js',
'#PLUGIN_FILES#File_Size_Checker.js'))
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_file_size (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin )',
'    return apex_plugin.t_dynamic_action_render_result',
'    is ',
'    l_page_item varchar2(2500) :=p_dynamic_action.attribute_03;',
'',
'        l_max_size number :=p_dynamic_action.attribute_04;',
'    l_result apex_plugin.t_dynamic_action_render_result;',
'    ',
'    begin',
'    ',
'IF apex_application.g_debug THEN ',
'APEX_PLUGIN_UTIL.DEBUG_DYNAMIC_ACTION (',
'    p_plugin => p_plugin,',
'    p_dynamic_action => p_dynamic_action);',
'END IF;',
'',
'-- -- add JavaScript files',
'apex_javascript.add_library(p_name           => ''v_file_size'',',
'                            p_directory      => p_plugin.file_prefix,',
'                            p_version        => NULL,',
'                            p_skip_extension => FALSE);',
'',
'apex_javascript.add_library(p_name           => ''File_Size_Checker'',',
'                            p_directory      => p_plugin.file_prefix,',
'                            p_version        => NULL,',
'                            p_skip_extension => FALSE);',
'',
'l_result.attribute_03 :=l_page_item;',
'l_result.javascript_function := ''function(){FileSizeChecker(''||l_page_item||'',''||l_max_size||'');}'';',
'return l_result;',
'    end;'))
,p_api_version=>2
,p_render_function=>'render_file_size'
,p_ajax_function=>'render_file_size'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1> How to implement the File Size Checker Plug-In.</h1>',
'<br>',
'1) Create Region ',
'2) Create Page Item with type File Browse ',
'3) Create DA on change of  File Browse Page Item. --> Select Action as FileSize Plug-In',
'4) Go to Setting --> Set the File Browse Page Item & define the Max Size Allowed(KB)'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://way2cis.blogspot.com/'
,p_files_version=>37
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(531742083334996064)
,p_plugin_id=>wwv_flow_api.id(531716196086729693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'File Browse Page Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(535478249472339410)
,p_plugin_id=>wwv_flow_api.id(531716196086729693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Max Size Allowed(KB)'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1024'
,p_display_length=>50
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20765F66696C655F73697A6528705F6974656D2C705F73697A65290A7B0A0A7661722066696C655F73697A65203D202428705F6974656D295B305D2E66696C65735B305D2E73697A653B0A2F2F7661722066696C655F73697A653D34';
wwv_flow_api.g_varchar2_table(2) := '30303B0A2F2F636F6E736F6C652E6C6F672827705F6974656D20272C705F6974656D293B0A76617220705F76616C7565203D202428705F73697A652E6964290A2F2F636F6E736F6C652E6C6F672827705F73697A65272C705F76616C7565293B0A696620';
wwv_flow_api.g_varchar2_table(3) := '2866696C655F73697A65203E3D203130303029200A7B0A616C657274282766696C652073697A652073686F756C64206265203C2031303030206B6227293B0A7D0A656C73650A7B090A247328705F73697A652C66696C655F73697A65293B0A7D0A2F2F63';
wwv_flow_api.g_varchar2_table(4) := '6F6E736F6C652E6C6F672827456E74657220696E2066696C652073697A652027293B0A0A0A72657475726E2066696C655F73697A653B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(535466655296171434)
,p_plugin_id=>wwv_flow_api.id(531716196086729693)
,p_file_name=>'v_file_size.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E2046696C6553697A65436865636B657228705F6974656D2C705F73697A65290A7B0A7661722066696C655F73697A65203D202428705F6974656D295B305D2E66696C65735B305D2E73697A653B0A09097661722078203D2066696C65';
wwv_flow_api.g_varchar2_table(2) := '5F73697A652F313032343B0A09096966202878203E3D20705F73697A6529200A09097B0A092F2F092428705F6974656D292E76616C282727293B200A0909247828705F6974656D292E76616C7565203D206E756C6C3B0A09617065782E6D657373616765';
wwv_flow_api.g_varchar2_table(3) := '2E616C657274282746696C652073697A652073686F756C64206265203C20272B705F73697A65202B27204B4227293B0A0A09097D0A72657475726E2066696C655F73697A653B0A7D0A0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(535476699588314529)
,p_plugin_id=>wwv_flow_api.id(531716196086729693)
,p_file_name=>'File_Size_Checker.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
