USE [CATALOGOS]
GO
/****** Object:  StoredProcedure [dbo].[getInfoUser]    Script Date: 11/09/2017 12:56:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[getInfoUser]
	@user varchar(33),
	@pass varchar(33),
	@tryn int,
	@id_emp int
AS
BEGIN TRY
	DECLARE 
		@msg varchar(500) = ''
		, @cve_deptoW int = 0
		, @app int = 0

	BEGIN 
		/* Validation of attempts */
		IF (@tryn >= 3) 
			BEGIN
				UPDATE CATALOGOS.dbo.te_users_passw_encrypt 
				SET peusr_passw_encrypt_lock = 1 
				WHERE peusr_user_id = @id_emp
			END

		/* Get application */
		SELECT @app = app.id_ap
		FROM CATALOGOS.dbo.tc_aplicaciones app WITH(NOLOCK)
		WHERE app.nombre_ap = 'GCP'

		SELECT 
			enc.peusr_passw_encrypt_lock AS [on_lock]
			, enc.peusr_passw_encrypt_reset AS [reset]
			, emp.estatus
			, emp.cve_depto AS [id_sucursal]
			, CASE 
				WHEN emp.cve_puesto IN (16, 11, 13, 30, 29) OR emp.id_empleados IN (3, 27, 52, 239) THEN 1001
				ELSE emp.cve_depto END AS [id_sucursalW]
			, emp.cve_puesto AS [id_puesto]
			, emp.id_empleados
			, RTRIM(LTRIM(emp.nombre)) AS [nombre]
			, RTRIM(LTRIM(emp.ap_paterno)) AS [apellido_paterno]
			, RTRIM(LTRIM(emp.ap_materno)) AS [apellido_materno]
			, RTRIM(LTRIM(emp.nombre)) + ' ' + RTRIM(LTRIM(emp.ap_paterno)) + ' ' + RTRIM(LTRIM(emp.ap_materno)) AS [nombre_emp]
			, @pass AS [hash]
		INTO #tmpUser
		FROM CATALOGOS.dbo.tc_empleados emp WITH(NOLOCK)
			INNER JOIN CATALOGOS.dbo.tc_departamento dep WITH(NOLOCK) ON (emp.cve_depto = dep.id_departamento) 
			INNER JOIN CATALOGOS.dbo.te_users_passw_encrypt enc WITH(NOLOCK) ON (enc.peusr_user_id = emp.id_empleados)
		WHERE enc.peusr_passw_encrypt = @pass 
			AND emp.estatus = 1

		SET @cve_deptoW = ISNULL((SELECT id_sucursalW FROM #tmpUser WHERE [hash] = @pass), 0)

		IF (@cve_deptoW = 0)
			BEGIN
				RAISERROR('Sucursal no válida', 16, 1)
			END

		/* General information */
		SELECT * 
		FROM #tmpUser

		/* Departaments */
		SELECT
			1001 AS [departamentID]
			, '-- Todo Porvenir' AS [departamentName]
		UNION
		SELECT
			a.id_departamento AS [departamentID]
			, REPLICATE('0', 3-LEN(a.id_departamento)) + CAST(a.id_departamento AS varchar) + '-' + CAST(INVENTARIO.dbo.fnStripSpaces(a.descripcion) AS varchar) AS [departamentName]
		FROM CATALOGOS.dbo.tc_departamento a WITH(NOLOCK)
		WHERE ((@cve_deptoW <> 1001 AND a.id_departamento = @cve_deptoW) OR (@cve_deptoW = 1001 AND a.id_departamento < 300))
		ORDER BY 2
		
		/* Menu */
		SELECT a.tcmenu_id
		, tcmenu_id_ap
		, tcmenu_descrip
		, tcmenu_parent
		, tcmenu_url
		, tcmenu_estatus
		, tcmenu_order
		, tcmenu_class
		, tcmenu_icon
		FROM CATALOGOS.dbo.tc_menus a WITH(NOLOCK)
		WHERE tcmenu_id_ap = @app
			AND tcmenu_estatus = 1 
			AND tcmenu_id IN ( SELECT pa_tcmenu_id
						    FROM CATALOGOS.dbo.tc_acceso_perfiles per WITH(NOLOCK)
						    WHERE per.pa_cve_depto IN (SELECT id_sucursal FROM #tmpUser)
							 AND per.pa_cve_puesto IN (SELECT id_puesto FROM #tmpUser)
							 AND per.pa_ap_id = @app
						    UNION
						    SELECT a.tcmenu_parent
						    FROM CATALOGOS.dbo.tc_menus a WITH(NOLOCK)
						    WHERE a.tcmenu_id IN ( SELECT per.pa_tcmenu_id
											  FROM CATALOGOS.dbo.tc_acceso_perfiles per WITH(NOLOCK)
											  WHERE per.pa_cve_depto IN (SELECT id_sucursal FROM #tmpUser)
												AND per.pa_cve_puesto IN (SELECT id_puesto FROM #tmpUser)
												AND per.pa_ap_id = @app
											 )
						)
		ORDER BY a.tcmenu_id, a.tcmenu_order 
							
	END
END TRY
BEGIN CATCH
	SET @msg = (SELECT ERROR_MESSAGE())
	RAISERROR(@msg, 16, 1)
END CATCH 