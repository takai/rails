ActiveRecord::Schema.define do
  create_table :binary_fields, :force => true do |t|
    t.binary :tiny_blob,   :limit => 255
    t.binary :normal_blob, :limit => 65535
    t.binary :medium_blob, :limit => 16777215
    t.binary :long_blob,   :limit => 2147483647
    t.text   :tiny_text,   :limit => 255
    t.text   :normal_text, :limit => 65535
    t.text   :medium_text, :limit => 16777215
    t.text   :long_text,   :limit => 2147483647
  end

  ActiveRecord::Base.connection.execute <<-SQL
DROP PROCEDURE IF EXISTS ten;
SQL

  ActiveRecord::Base.connection.execute <<-SQL
CREATE PROCEDURE ten() SQL SECURITY INVOKER
BEGIN
	select 10;
END
SQL

  ActiveRecord::Base.connection.execute <<-SQL
DROP TABLE IF EXISTS collation_tests;
SQL

  ActiveRecord::Base.connection.execute <<-SQL
CREATE TABLE collation_tests (
  string_cs_column VARCHAR(1) COLLATE utf8_bin,
  string_ci_column VARCHAR(1) COLLATE utf8_general_ci
) CHARACTER SET utf8 COLLATE utf8_general_ci
SQL

end
