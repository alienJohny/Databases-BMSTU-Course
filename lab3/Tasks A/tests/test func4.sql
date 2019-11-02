use data

go

-- Test 1
if (select dbo.fact(5)) = 120
    print 'TEST 1 --- OK'
else
    print 'TEST 1 --- ERROR'

-- Test 2
if (select dbo.fact(1)) = 1
    print 'TEST 2 --- OK'
else
    print 'TEST 2 --- ERROR'

-- Test 3
if (select dbo.fact(0)) = 0
    print 'TEST 3 --- OK'
else
    print 'TEST 3 --- ERROR'

-- Test 4
if (select dbo.fact(-1)) = -1
    print 'TEST 4 --- OK'
else
    print 'TEST 4 --- ERROR'