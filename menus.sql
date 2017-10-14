--ALTER TABLE CATALOGOS.dbo.tc_aplicaciones ADD icon_ap VARCHAR(30)

--ALTER TABLE CATALOGOS.dbo.tc_aplicaciones
--ADD CONSTRAINT def_icon_ap DEFAULT('') FOR icon_ap

--UPDATE CATALOGOS.dbo.tc_aplicaciones SET
--	icon_ap = ''


SELECT *
FROM CATALOGOS.dbo.tc_aplicaciones

--use CATALOGOS
--go
--sp_help tc_aplicaciones

/*

    INSERT INTO CATALOGOS.dbo.tc_aplicaciones (nombre_ap, url_ap, orden, estatus, icon_ap)
    VALUES('GCP', 'http://192.168.1.14/app', 25, 1, 'fa fa-times')

    INSERT INTO CATALOGOS.dbo.tc_aplicaciones (nombre_ap, url_ap, orden, estatus, icon_ap)
    VALUES('SFP', 'http://192.168.1.6/app', 22, 1, 'fa fa-times')

*/
SELECT *
FROM CATALOGOS.dbo.tc_menus

/*

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(22, 'Cobranza', 0, '#', 1, 1, '{ active: view.page == "/collection/management" || view.page == "/collection/management/client/" + view.urlClient + "/credit/" + view.urlCredit || view.page == "/collection/report" }', 'fa fa-dollar')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(22, 'Gestión', 229, '#/collection/management', 1, 2, '{ active: view.page == "/collection/management" || view.page == "/collection/management/client/" + view.urlClient + "/credit/" + view.urlCredit }', '')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(22, 'Reporte', 229, '#/collection/report', 1, 3, '{ active: view.page == "/collection/report" }', '')

    -- PREVENCIÓN DE FRAUDES

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(25, 'Prevención de fraudes', 0, '#', 1, 1, '{ active: view.page == "/fraudPrevention/review" }', 'fa fa-lock')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(25, 'Revisión', 269, '#/fraudPrevention/review', 1, 2, '{ active: view.page == "/fraudPrevention/review" }', '')

*/

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--VALUES(25, 'SIGAQ', 0, '#', 1, 1, '{active:view.page == "/brokenessManagement/audit" || view.page == "/brokenessManagement/responsable/" + view.urlEmployee || view.page == "/brokenessManagement/humanTalent" || view.page == "/brokenessManagement/finance" || view.page == "/brokenessManagement/brokenessPayment"}', 'fa fa-chain-broken')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--VALUES(25, 'Auditoria', 271, '#/brokenessManagement/audit', 1, 2, '{active:view.page == "/brokenessManagement/audit" || view.page == "/brokenessManagement/responsable/" + view.urlEmployee }', '')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--VALUES(25, 'Talento Humano', 271, '#/brokenessManagement/humanTalent', 1, 3, '{active:view.page == "/brokenessManagement/humanTalent"}', '')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--VALUES(25, 'Finanzas', 271, '#', 1, 4, '{active:view.page == "/brokenessManagement/finance" || view.page == "/brokenessManagement/brokenessPayment"}', '')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--VALUES(25, 'Asignación', 274, '#/brokenessManagement/finance', 1, 5, '', '')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--VALUES(25, 'Cobro', 274, '#/brokenessManagement/brokenessPayment', 1, 6, '', '')

--UPDATE CATALOGOS.dbo.tc_menus SET
--	--tcmenu_descrip = 'Asignación'
--	--tcmenu_url = '#'
--	tcmenu_class = '{active:view.page == "/brokenessManagement/audit" || view.page == "/brokenessManagement/responsable/" + view.urlEmployee || view.page == "/brokenessManagement/humanTalent" || view.page == "/brokenessManagement/finance" || view.page == "/brokenessManagement/brokenessPayment"}'
--where tcmenu_id = 271
--	/*or tcmenu_id = 276*/

--UPDATE CATALOGOS.dbo.tc_menus SET
--	tcmenu_descrip = 'P. Lavado de dinero'
--where tcmenu_id = 232

--UPDATE CATALOGOS.dbo.tc_menus SET
--	tcmenu_order = 5
--where tcmenu_id = 236

-- INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--    VALUES(22, 'P. Lavado de dinero', 0, '#', 1, 1, '{ active: view.page == "/pld/dailyRequirement" || view.page == "/pld/authconfig" || view.page == "/pld/inquiries" || view.page == "/pld/wisw" }', 'fa fa-shield')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--    VALUES(22, 'Requerimiento diario', 232, '#', 1, 2, '{ active: view.page == "/pld/dailyRequirement" }', '')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--    VALUES(22, 'Autoridades', 232, '#', 1, 3, '{ active: view.page == "pld/authconfig" }', '')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--    VALUES(22, 'Consulta', 232, '#', 1, 4, '{ active: view.page == "/pld/inquiries" }', '')

--INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--    VALUES(22, 'Quien es Quien', 232, '#', 1, 5, '{ active: view.page == "/pld/wisw" }', '')
