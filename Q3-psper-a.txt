
DECLARE
    -- Cursor to fetch CD and Artist details
    CURSOR cd_cursor IS
        SELECT c.Cd_id, a.Art_id, a.Art_nm, c.Title, c.Prize, c.Quantity, 
               (c.Prize * c.Quantity) AS Value
        FROM CD c
        JOIN Artist a ON c.Art_id = a.Art_id;

    -- Variables to hold fetched data
    v_Cd_id CD.Cd_id%TYPE;
    v_Art_id Artist.Art_id%TYPE;
    v_Art_nm Artist.Art_nm%TYPE;
    v_Title CD.Title%TYPE;
    v_Prize CD.Prize%TYPE;
    v_Quantity CD.Quantity%TYPE;
    v_Value NUMBER(10,2);
    v_Total_Value NUMBER(10,2) := 0;

BEGIN
    -- Print the header
    DBMS_OUTPUT.PUT_LINE('SUMMARY');
    DBMS_OUTPUT.PUT_LINE('Current Date: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(RPAD('Artist ID', 12) || RPAD('Artist Name', 15) || RPAD('CD ID', 8) || RPAD('Title', 15) || RPAD('Price', 8) || RPAD('Quantity', 10) || 'Value');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------');

    -- Open the cursor and fetch records
    FOR cd_record IN cd_cursor LOOP
        -- Assign values to variables
        v_Cd_id := cd_record.Cd_id;
        v_Art_id := cd_record.Art_id;
        v_Art_nm := cd_record.Art_nm;
        v_Title := cd_record.Title;
        v_Prize := cd_record.Prize;
        v_Quantity := cd_record.Quantity;
        v_Value := cd_record.Value;

        -- Print record
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Art_id, 12) || RPAD(v_Art_nm, 15) || RPAD(v_Cd_id, 8) || RPAD(v_Title, 15) || RPAD(v_Prize, 8) || RPAD(v_Quantity, 10) || v_Value);

        -- Accumulate total value
        v_Total_Value := v_Total_Value + v_Value;
    END LOOP;

    -- Print total value
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TOTAL VALUE : ' || v_Total_Value);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No records found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
