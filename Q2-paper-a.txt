SET SERVEROUTPUT ON;

DECLARE
    v_Cd_id CD.Cd_id%TYPE := '&Enter_Cd_id';
    v_Art_id CD.Art_id%TYPE;
    v_Title CD.Title%TYPE;
    v_Prize CD.Prize%TYPE;
    v_Quantity CD.Quantity%TYPE;
    v_Year CD.Year%TYPE;
BEGIN
    -- Fetch the CD details
    SELECT Art_id, Title, Prize, Quantity, Year
    INTO v_Art_id, v_Title, v_Prize, v_Quantity, v_Year
    FROM CD
    WHERE Cd_id = v_Cd_id;

    -- Displaying the output
    DBMS_OUTPUT.PUT_LINE('CD ID       : ' || v_Cd_id);
    DBMS_OUTPUT.PUT_LINE('Artist ID   : ' || v_Art_id);
    DBMS_OUTPUT.PUT_LINE('Title       : ' || v_Title);
    DBMS_OUTPUT.PUT_LINE('Price       : ' || v_Prize);
    DBMS_OUTPUT.PUT_LINE('Quantity    : ' || v_Quantity);
    DBMS_OUTPUT.PUT_LINE('Year        : ' || v_Year);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found for CD ID: ' || v_Cd_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
