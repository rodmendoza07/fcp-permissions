--inserta aplicacion
INSERT INTO CATALOGOS.dbo.tc_aplicaciones (nombre_ap, url_ap, orden, estatus, icon_ap)
VALUES('GCP', 'http://192.168.1.8/app', 25, 1, 'fa fa-times')

--inserta menus de aplicacion

--Prevencion de fraudes
BEGIN
	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
	VALUES(25, 'Prevención de fraudes', 0, '#', 1, 1, '{ active: view.page == "/fraudPrevention/review" }', 'fa fa-lock')

	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
	VALUES(25, 'Revisión', 266, '#/fraudPrevention/review', 1, 2, '{ active: view.page == "/fraudPrevention/review" }', '')
END

-- SIGAQ
BEGIN
	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
	VALUES(25, 'SIGAQ', 0, '#', 1, 1, '{active:view.page == "/brokenessManagement/audit" || view.page == "/brokenessManagement/responsable/" + view.urlEmployee || view.page == "/brokenessManagement/humanTalent" || view.page == "/brokenessManagement/finance" || view.page == "/brokenessManagement/brokenessPayment"}', 'fa fa-chain-broken')

	-- SIGAQ Auditoria
	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
	VALUES(25, 'Auditoria', 268, '#/brokenessManagement/audit', 1, 2, '{active:view.page == "/brokenessManagement/audit" || view.page == "/brokenessManagement/responsable/" + view.urlEmployee }', '')

	-- SIGAQ TH
	INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
	VALUES(25, 'Talento Humano', 268, '#/brokenessManagement/humanTalent', 1, 3, '{active:view.page == "/brokenessManagement/humanTalent"}', '')

	-- SIGAQ FINANZAS
	BEGIN
		INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
		VALUES(25, 'Finanzas', 268, '#', 1, 4, '{active:view.page == "/brokenessManagement/finance" || view.page == "/brokenessManagement/brokenessPayment"}', '')

		--SIGAQ ASIGNACION
		INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
		VALUES(25, 'Asignación', 271, '#/brokenessManagement/finance', 1, 5, '{active:view.page == "/brokenessManagement/finance"}', '')

		--SIGAQ PAGOS
		INSERT INTO CATALOGOS.dbo.tc_menus(tcmenu_id_ap, tcmenu_descrip, tcmenu_parent, tcmenu_url, tcmenu_estatus, tcmenu_order, tcmenu_class, tcmenu_icon)
		VALUES(25, 'Pagos', 271, '#/brokenessManagement/brokenessPayment', 1, 6, '{active:view.page == "/brokenessManagement/brokenessPayment"}', '')
	END
END


SELECT *
FROM CATALOGOS.dbo.tc_menus

SELECT *
FROM CATALOGOS.dbo.tc_aplicaciones
