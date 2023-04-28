-- 查看某个数据库的表的用的字符集
SELECT 
	TABLE_SCHEMA '数据库',
	TABLE_NAME '表',
	TABLE_COLLATION '原排序规则',
	CONCAT('ALTER TABLE ',TABLE_NAME, ' CHARACTER SET=utf8mb4,  COLLATE=utf8mb4_general_ci;') '修正SQL'
FROM information_schema.`TABLES` 
where TABLE_COLLATION != 'utf8mb4_general_ci'
and TABLE_SCHEMA = 'oss-quartz';


-- 查看数据库中所有字段用的排序规则
SELECT
	TABLE_SCHEMA '数据库',
	TABLE_NAME '表',
	COLUMN_NAME '字段',
	CHARACTER_SET_NAME '原字符集',
	COLLATION_NAME '原排序规则',
	CONCAT(
		'ALTER TABLE ',
		TABLE_NAME,
		' MODIFY COLUMN ',
		COLUMN_NAME,
		' ',
		COLUMN_TYPE,
	-- - 设置新的编码和排序规则
		' CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci',
		( CASE WHEN IS_NULLABLE = 'NO' THEN ' NOT NULL' ELSE '' END ),
		( CASE WHEN COLUMN_COMMENT = '' THEN ' ' ELSE concat( ' COMMENT''', COLUMN_COMMENT, '''' ) END ),
		';' 
	) '修正SQL' 
FROM information_schema.`COLUMNS` 
WHERE COLLATION_NAME != 'utf8mb4_general_ci' 
AND TABLE_SCHEMA = 'oss-quartz';


