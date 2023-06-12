CREATE OR REPLACE FUNCTION get_row_as_json(table_name TEXT, column_name TEXT, row_id INTEGER) RETURNS JSON AS $$
  DECLARE
    json_result JSON;
  BEGIN
    RETURN QUERY EXECUTE format('
      SELECT ROW_TO_JSON(t)
      FROM %I t
      WHERE t.%I = $1', table_name, column_name)
    INTO json_result
    USING row_id;

    RETURN json_result;
  END
$$ language plpgsql;