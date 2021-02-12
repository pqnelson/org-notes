\def\title{\uppercase{xUnit Framework for C}}

\input macros

@* Introduction.
We modify the approach of Gerard Meszaros's {\sl xUnit Test Patterns}.
The basic idea is to organize tests into suites. For our purposes, we
have a ``test case'' for a single unit test, organized into a
``test suite'', which is then executed by a ``test runner''. Phrased
differently, a test runner iterates through each test suite, and for
each suite the runner iterates through each test case in the suite.

We deviate from the terminology standard in the xUnit framework, because
a system under test has all its tests organized into a TestCase class.
Its methods are precisely the tests to be performed.

However, JUnit followed a different pattern, using TestCase classes as
command paterns\footnote{\pdfURL{Cook's Tour}{http://junit.sourceforge.net/doc/cookstour/cookstour.htm}}, as a wrapper for a
single test, and organize them into test suites. Each TestCase produces
a TestResult upon running.

If we were more
faithful in our terminology, we would have a TestCase be a collection of
Test structures, a data structure wrapping around a function pointer.
The TestSuite would be a collection of TestCases.