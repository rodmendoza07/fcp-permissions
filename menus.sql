SELECT *
FROM CATALOGOS.dbo.tc_aplicaciones

/*

    INSERT INTO CATALOGOS.dbo.tc_aplicaciones (nombre_ap, url_ap, orden, estatus, icon_ap)
    VALUES('GCP', 'http://192.168.1.14/app', 25, 1, 'fa fa-times')

    INSERT INTO CATALOGOS.dbo.tc_aplicaciones (nombre_ap, url_ap, orden, estatus, icon_ap)
    VALUES('SFP', 'http://192.168.1.14/app', 26, 1, 'fa fa-times')

*/

SELECT *
FROM CATALOGOS.dbo.tc_menus

/*

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(25, 'Cobranza', 0, '#', 1, 1, '{ active: view.page == "/collection/management" || view.page == "/collection/management/client/" + view.urlClient + "/credit/" + view.urlCredit || view.page == "/collection/report" }', 'fa fa-dollar')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(25, 'Gestión', 266, '#/collection/management', 1, 2, '{ active: view.page == "/collection/management" || view.page == "/collection/management/client/" + view.urlClient + "/credit/" + view.urlCredit }', '')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(25, 'Reporte', 266, '#/collection/report', 1, 3, '{ active: view.page == "/collection/report" }', '')

    -- PREVENCIÓN DE FRAUDES

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(25, 'Prevención de fraudes', 0, '#', 1, 1, '{ active: view.page == "/fraudPrevention/review" }', 'fa fa-lock')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(25, 'Revisión', 269, '#/fraudPrevention/review', 1, 2, '{ active: view.page == "/fraudPrevention/review" }', '')

*/