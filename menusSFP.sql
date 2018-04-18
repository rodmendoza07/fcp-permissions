ALTER TABLE CATALOGOS.dbo.tc_aplicaciones
ADD [icon_ap] VARCHAR(30)

ALTER TABLE CATALOGOS.dbo.tc_aplicaciones
ADD CONSTRAINT def_icon DEFAULT('') FOR [icon_ap]

/*
--ROLLBACK DE COLUMNAS
ALTER TABLE CATALOGOS.dbo.tc_aplicaciones
DROP COLUMN [icon_ap]
ALTER TABLE CATALOGOS.dbo.tc_aplicaciones
DROP CONSTRAINT def_icon FOR [icon_ap]
*/

UPDATE CATALOGOS.dbo.tc_aplicaciones SET [icon_ap] = 'fa fa-times'

--inserta aplicacion
INSERT INTO CATALOGOS.dbo.tc_aplicaciones (nombre_ap, url_ap, orden, estatus, icon_ap)
VALUES('SFP', 'http://192.168.1.4/app', 22, 1, 'fa fa-times')

--inserta menus de aplicacion

ALTER TABLE CATALOGOS.dbo.tc_menus
ADD tcmenu_class VARCHAR(MAX)
ALTER TABLE CATALOGOS.dbo.tc_menus
ADD CONSTRAINT def_tcmenus_class DEFAULT ('') FOR tcmenu_class

ALTER TABLE CATALOGOS.dbo.tc_menus
ADD tcmenu_icon VARCHAR(200)
ALTER TABLE CATALOGOS.dbo.tc_menus
ADD CONSTRAINT def_tcmenu_icon DEFAULT ('') FOR tcmenu_icon

UPDATE CATALOGOS.dbo.tc_menus SET 
	tcmenu_class = ''
	, tcmenu_icon = ''

--SELECT * FROM CATALOGOS.dbo.tc_menus

--update CATALOGOS.dbo.tc_menus set tcmenu_parent = 230 where tcmenu_id = 231


--Condonaciones
BEGIN
	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
	VALUES(22, 'Condonaciones', 0, '#', 1, 1, '{ active: view.page == "/collection/management" || view.page == "/collection/management/client/" + view.urlClient + "/credit/" + view.urlCredit || view.page == "/collection/report/condonation" || view.page == "/collection/report/management" }', 'fa fa-dollar')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(22, 'Gestión', 230, '#/collection/management', 1, 2, '{ active: view.page == "/collection/management" || view.page == "/collection/management/client/" + view.urlClient + "/credit/" + view.urlCredit }', '')

    INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
    VALUES(22, 'Reportes', 230, '#', 1, 3, '{ active: view.page == "/collection/report/condonation" || view.page == "/collection/report/management" }', '')

	INSERT INTO CATALOGOS.dbo.tc_menus (tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
	VALUES(22,'Condonaciones', 232, '#/collection/report/condonation', 1, 4, '{ active:view.page == "/collection/report/condonation" }', '')
	, (22,'Gestión', 232, '#/collection/report/management', 1, 5, '{ active:view.page == "/collection/report/management" }', '')


END

-- PLD
--BEGIN
--	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--	VALUES(22, 'P. Lavado de dinero', 0,'#', 1, 1, '{ active: view.page == "/pld/dailyRequirement" || view.page == "/pld/authconfig" || view.page == "/pld/inquiries" || view.page == "/pld/wisw" }', 'fa fa-shield')

--	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--	VALUES(22, 'Requerimiento diario', 232, '#/pld/dailyRequirement', 1, 2, '{ active: view.page == "/pld/dailyRequirement" }', '')

--	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
--    VALUES(22, 'Autoridades', 232, '#/pld/authconfig', 1, 3, '{ active: view.page == "/pld/authconfig" }', '')

--END

SELECT *
FROM CATALOGOS.dbo.tc_menus
WHERE tcmenu_id > 200

SELECT *
FROM CATALOGOS.dbo.tc_aplicaciones
ORDER BY orden ASC
