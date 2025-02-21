SET SERVEROUTPUT ON;

DECLARE
    v_Cd_id CD.Cd_id%TYPE := TRIM(UPPER('&Enter_Cd_id'));
    v_Record CD%ROWTYPE;
BEGIN
    -- Fetch the CD details
    SELECT * INTO v_Record FROM CD WHERE TRIM(UPPER(Cd_id)) = v_Cd_id;

    -- Display the output
    DBMS_OUTPUT.PUT_LINE('CD ID       : ' || v_Cd_id);
    DBMS_OUTPUT.PUT_LINE('Artist ID   : ' || v_Record.Art_id);
    DBMS_OUTPUT.PUT_LINE('Title       : ' || v_Record.Title);
    DBMS_OUTPUT.PUT_LINE('Price       : ' || v_Record.Prize);
    DBMS_OUTPUT.PUT_LINE('Quantity    : ' || v_Record.Quantity);
    DBMS_OUTPUT.PUT_LINE('Year        : ' || v_Record.Year);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found for CD ID: ' || v_Cd_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
