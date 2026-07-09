-- 1. BEGIN THE TRANSACTION
-- We lock the database state. Nothing we do here is permanent until we say COMMIT.
START TRANSACTION;

-- =========================================================================
-- PHASE 1: THE DEPARTMENT SHAKE-UP (SAFE WORK)
-- =========================================================================

-- Step 1: The current manager of the Development department ('d005') is retiring today.
-- We must "close" their active record by changing their to_date to today.
UPDATE dept_manager 
SET to_date = CURRENT_DATE 
WHERE dept_no = 'd005' AND to_date = '9999-01-01';

-- Step 2: Employee 10002 (Bezalel Simmel) is being promoted to the new manager.
-- We insert his new active record.
INSERT INTO dept_manager (emp_no, dept_no, from_date, to_date) 
VALUES (10002, 'd005', CURRENT_DATE, '9999-01-01');

-- Step 3: CREATE A SAVEPOINT
-- We have successfully updated the management structure. This was hard work! 
-- We set a "bookmark" here so we don't lose this work if the next steps fail.
SAVEPOINT manager_updated_successfully;

-- =========================================================================
-- PHASE 2: THE DISASTER
-- =========================================================================

-- Step 4: The Junior Dev needs to give the new manager a $50,000 raise. 
-- BUT THEY FORGET THE 'WHERE' CLAUSE!
UPDATE salaries 
SET salary = salary + 50000;
-- DISASTER STRIKES: The console outputs: "300,024 rows affected." 
-- The developer just accidentally bankrupted the company by giving EVERYONE a raise!

-- =========================================================================
-- PHASE 3: THE RESCUE
-- =========================================================================

-- Step 5: PARTIAL ROLLBACK
-- Instead of typing a full ROLLBACK (which would undo the manager promotion too),
-- we time-travel back to exactly where we placed our bookmark.
ROLLBACK TO manager_updated_successfully;
-- The accidental $50,000 company-wide raise is erased. 
-- The manager promotion from Phase 1 remains completely intact in memory.

-- Step 6: DOING IT RIGHT
-- We correctly update the salary for JUST the new manager.
-- (Remember: Close the old active salary first, then insert the new active one).
UPDATE salaries 
SET to_date = CURRENT_DATE 
WHERE emp_no = 10002 AND to_date = '9999-01-01';

INSERT INTO salaries (emp_no, salary, from_date, to_date) 
VALUES (10002, 120000, CURRENT_DATE, '9999-01-01');

-- =========================================================================
-- PHASE 4: SAVING THE WORK
-- =========================================================================

-- Step 7: COMMIT
-- Everything is finally correct. We permanently write the new manager 
-- and their specific salary raise to the hard drive.
COMMIT;