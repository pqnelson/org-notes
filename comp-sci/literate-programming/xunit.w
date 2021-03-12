\def\title{\uppercase{xUnit Framework for C}}
% `cweave xunit.w` to produce the tex file
% `ctangle xunit.w` to produce the .c file


\input macros

@* Introduction.
We modify the approach of Gerard Meszaros's {\sl xUnit Test Patterns}.
The common features xUnit test frameworks share, they provide a way to
perform the following tasks:
\item{1.} Specify a test,
\item{2.} Specify the expected results within a test in the forms of
function calls to assertion methods,
\item{3.} Aggregate the tests into test suites that can be run as a
single operation,
\item{4.} Run one or more tests to get a report on the results of the
test run.

@
{\bf Caution: Abuse of Language.\quad}\ignorespaces%
For object-oriented languages, there is some more boiler plate.
The basic idea is to organize tests into suites. For our purposes, we
have a ``test case'' for a single unit test, organized into a
``test suite'', which is then executed by a ``test runner''. Phrased
differently, a test runner iterates through each test suite, and for
each suite the runner iterates through each test case in the suite.

We deviate from the terminology standard in the xUnit framework, because
a system under test has all its tests organized into a TestCase class.
Its methods are precisely the tests to be performed.

However, JUnit followed a different pattern, using TestCase classes as
command paterns (c.f., \pdfURL{Cook's Tour}{http://junit.sourceforge.net/doc/cookstour/cookstour.htm}), as a wrapper for a
single test, and organize them into test suites. Each TestCase produces
a TestResult upon running.

If we were more faithful in our terminology, we would have a TestCase be
a collection of Test structures, a data structure wrapping around a
function pointer. The TestSuite would be a collection of TestCases.

@ The xunit header contains all the public-facing function declarations.

@(xunit.h@>=
#ifndef XUNIT_H
#define XUNIT_H
@#
@<TestCase declarations@> @/
@<TestSuite declarations@> @/
@<Assertion macros@>
@#
#endif /* \.{XUNIT\_H} */

@ The test case declarations amount to just a typedef. It really encodes
two things: the function pointer to the test itself, and metadata
tracking the test results. The constructor expects only a function
pointer, and returns a newly allocated TestCase object. Dually we free
TestCase objects by reference. We should also track the name of the test
case, to help the programmer look up failed tests.

@<TestCase decl...@>=
typedef struct TestCase TestCase;
@#
TestCase test_new(void (*test)(TestCase *this), const char *test_name);
void test_free(TestCase *this);

@ The test suite declarations include typedefs as well as the
boiler-plate constructor and destructor functions. A test suite is a
linked-list of either nested test suites or test cases. In either case,
we abstract away the implementation details by just providing a method
to add a suite to a given test suite, and another to add a test case to
a test suite.

@<TestSuite decl...@>=
typedef struct TestSuite TestSuite;
@#
TestSuite *suite_new(const char *name);
void suite_free(TestSuite *this);
void suite_addTest(TestSuite *this, TestCase *test);
void suite_addSuite(TestSuite *this, TestSuite *suite);

@ Assertions update the test result to reflect the outcome of the test:
failure, success, exception. Success corresponds to the ``true'' value
(which is defined to be 1 in \.{stdbool.h}).

@<Assertion macros@>=
enum TestResult {
     RESULT_UNTESTED = -2, @/
     RESULT_SKIPPED = -1, @/
     RESULT_SUCCESS = 1, @/
     RESULT_FAILURE = 0, @/
     RESULT_EXCEPTION = 0
};
@#

@* Index.