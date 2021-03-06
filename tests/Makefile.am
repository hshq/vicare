## Process this file with automake to produce Makefile.in

testdir				= $(srcdir)
VICARE_SELECTED_TESTS		= $(testdir)/test-*$(file)*.sps
VICARE_SELECTED_LONG_TESTS	= $(testdir)/long-test-*$(file)*.sps
VICARE_SELECTED_FOREIGN_TESTS	= $(testdir)/foreign-test-*$(file)*.sps
VICARE_SELECTED_DEMOS		= $(testdir)/demo-*$(file)*.sps

VICARE_LIBDIR		= $(libdir)/scheme/r6rs

VICARE_FASL_DIRECTORY	= $(builddir)/../lib/fasl
VICARE_TEST_SEARCH_PATH	= $(srcdir):$(srcdir)/../lib:$(builddir)/../lib:$(srcdir)/../scheme
VICARE_TEST_FASL_PATH	= $(VICARE_FASL_DIRECTORY):$(VICARE_FASL_PATH)

# Enable timing of test files  execution.  We cannot include this in the
# separator  because  it needs  to  be  placed  between the  environment
# variables and the actual command line.
if WANT_TIME_TESTS
VICARE_TIME_TESTS	= $(TIME_PROGRAM) -p
endif

# The variable "VFLAGS" is for the user  to be set on the command line
# of "make" or "configure", for example:
#
#   make VFLAGS="-g -O2 --print-loaded-libraries"
#
VFLAGS		= @VFLAGS@

VICARE		= $(builddir)/../src/vicare
VICARE_BOOT	= $(builddir)/../scheme/vicare.boot
VICARE_FLAGS	= -b $(VICARE_BOOT) $(VFLAGS) --r6rs-script
VICARE_ENV	= \
	VICARE_LIBRARY_PATH=$(VICARE_TEST_SEARCH_PATH); export VICARE_LIBRARY_PATH;	\
	VICARE_FASL_DIRECTORY=$(VICARE_FASL_DIRECTORY); export VICARE_FASL_DIRECTORY;	\
	CHECK_TEST_NAME=$(name); export CHECK_TEST_NAME;				\
	VICARE_SRC_DIR=$(srcdir); export VICARE_SRC_DIR;				\
	VICARE_BUILDDIR=$(builddir); export VICARE_BUILDDIR;				\
	LD_LIBRARY_PATH=$(builddir)/../src/.libs; export LD_LIBRARY_PATH;
VICARE_RUN	= $(VICARE_ENV) $(VICARE_TIME_TESTS) $(GDB) $(VICARE) $(VICARE_FLAGS)

.PHONY: test tests test-r6rs long-test long-tests
.PHONY: demo demos foreign-test foreign-tests

test tests:
	@echo
	@for f in $(VICARE_SELECTED_TESTS); do $(VICARE_RUN) $$f; done
	@echo

long-test long-tests:
	@echo
	@for f in $(VICARE_SELECTED_LONG_TESTS); do $(VICARE_RUN) $$f; done
	@echo

foreign-test foreign-tests:
	@echo
	@for f in $(VICARE_SELECTED_FOREIGN_TESTS); do $(VICARE_RUN) $$f; done
	@echo

demo demos:
	@echo
	@for f in $(VICARE_SELECTED_DEMOS); do $(VICARE_RUN) $$f; done
	@echo

#page
#### running vicare from the build directory

VIE			= $(srcdir)/../scripts/vie

# The variable "user_flags"  is for the user to be  set on the command
# line of "make".
VICARE_TEST_RUN_FLAGS	= -b $(VICARE_BOOT) $(VFLAGS) $(user_flags)
VICARE_TEST_RUN_ENV	= \
	VICARE_LIBRARY_PATH=$(VICARE_TEST_SEARCH_PATH); export VICARE_LIBRARY_PATH;	\
	VICARE_SRC_DIR=$(srcdir); export VICARE_SRC_DIR;				\
	VICARE_BUILDDIR=$(builddir); export VICARE_BUILDDIR;
VICARE_TEST_RUN	= $(VICARE_TEST_RUN_ENV) $(VICARE) $(VICARE_TEST_RUN_FLAGS)
VICARE_TEST_VIE	= $(VICARE_TEST_RUN_ENV) $(VIE) $(VICARE) --raw-repl $(VICARE_TEST_RUN_FLAGS)


.PHONY: test-run test-vie test-exec-modes

test-run:
	$(VICARE_TEST_RUN)

test-vie:
	$(VICARE_TEST_VIE)

test-exec-modes:
	$(VICARE_TEST_RUN_ENV) $(srcdir)/test-exec-modes.sh $(VICARE) $(VICARE_BOOT) $(srcdir)

#page
#### interface to "make check"

# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#
# We must make sure that this ends with a semicolon!!!
AM_TESTS_ENVIRONMENT	= VICARE_CHECK_QUIET=yes; export VICARE_CHECK_QUIET; $(VICARE_ENV)
TEST_EXTENSIONS		= .sps
SPS_LOG_COMPILER	= $(VICARE)
AM_SPS_LOG_FLAGS	= -b $(VICARE_BOOT) $(user_flags)

TESTS			=	\
	test-r6rs-arithmetic-bitwise.sps		\
	test-r6rs-arithmetic-fixnums.sps		\
	test-r6rs-arithmetic-flonums.sps		\
	test-r6rs-base.sps				\
	test-r6rs-bytevectors.sps			\
	test-r6rs-conditions.sps			\
	test-r6rs-contrib.sps				\
	test-r6rs-control.sps				\
	test-r6rs-enums.sps				\
	test-r6rs-eval.sps				\
	test-r6rs-exceptions.sps			\
	test-r6rs-hashtables.sps			\
	test-r6rs-io-ports.sps				\
	test-r6rs-io-simple.sps				\
	test-r6rs-lists.sps				\
	test-r6rs-mutable-pairs.sps			\
	test-r6rs-mutable-strings.sps			\
	test-r6rs-programs.sps				\
	test-r6rs-r5rs.sps				\
	test-r6rs-reader.sps				\
	test-r6rs-records-procedural.sps		\
	test-r6rs-records-syntactic.sps			\
	test-r6rs-sorting.sps				\
	test-r6rs-syntax-case.sps			\
	test-r6rs-unicode.sps				\
	\
	test-ikarus-bignum-to-flonum.sps		\
	test-ikarus-bitwise.sps				\
	test-ikarus-bytevectors.sps			\
	test-ikarus-case-folding.sps			\
	test-ikarus-div-and-mod.sps			\
	test-ikarus-enums.sps				\
	test-ikarus-fasl.sps				\
	test-ikarus-fixnums.sps				\
	test-ikarus-fldiv-and-mod.sps			\
	test-ikarus-guardians.sps			\
	test-ikarus-hashtables.sps			\
	test-ikarus-lists.sps				\
	test-ikarus-normalization.sps			\
	test-ikarus-numerics.sps			\
	test-ikarus-r6rs-records-procedural.sps		\
	test-ikarus-reader.sps				\
	test-ikarus-set-position.sps			\
	test-ikarus-sorting.sps				\
	test-ikarus-strings.sps				\
	test-ikarus-symbol-table.sps			\
	test-ikarus-unicode.sps				\
	\
	test-vicare-amb.sps				\
	test-vicare-arguments-validation.sps		\
	test-vicare-bignums.sps				\
	test-vicare-bytevectors.sps			\
	test-vicare-bytevector-compounds.sps		\
	test-vicare-chars.sps				\
	test-vicare-collect.sps				\
	test-vicare-compensations.sps			\
	test-vicare-cond-expand.sps			\
	test-vicare-coroutines.sps			\
	test-vicare-custom-ports.sps			\
	test-vicare-enumerations.sps			\
	test-vicare-equality.sps			\
	test-vicare-errno.sps				\
	test-vicare-expander.sps			\
	test-vicare-debugging.sps			\
	test-vicare-fasl.sps				\
	test-vicare-fixnums.sps				\
	test-vicare-flonum-base.sps			\
	test-vicare-flonum-formatter.sps		\
	test-vicare-flonum-parser.sps			\
	test-vicare-general-c-buffers.sps		\
	test-vicare-keywords.sps			\
	test-vicare-infix.sps				\
	test-vicare-io.sps				\
	test-vicare-language-extensions.sps		\
	test-vicare-letrec-syntax.sps			\
	test-vicare-library-utils.sps			\
	test-vicare-lists.sps				\
	test-vicare-log.sps				\
	test-vicare-namespaces.sps			\
	test-vicare-net-channels-binary.sps		\
	test-vicare-net-channels-textual.sps		\
	test-vicare-numerics-generic.sps		\
	test-vicare-numerics-neg.sps			\
	test-vicare-numerics-inv.sps			\
	test-vicare-numerics-add.sps			\
	test-vicare-numerics-sub.sps			\
	test-vicare-numerics-mul.sps			\
	test-vicare-numerics-div.sps			\
	test-vicare-numerics-gcd.sps			\
	test-vicare-numerics-lcm.sps			\
	test-vicare-numerics-quotient.sps		\
	test-vicare-numerics-remainder.sps		\
	test-vicare-numerics-modulo.sps			\
	test-vicare-numerics-square.sps			\
	test-vicare-numerics-cube.sps			\
	test-vicare-numerics-sign.sps			\
	test-vicare-numerics-expt-fixnums.sps		\
	test-vicare-numerics-expt-bignums.sps		\
	test-vicare-numerics-expt-flonums.sps		\
	test-vicare-numerics-expt-ratnums.sps		\
	test-vicare-numerics-expt-cflonums.sps		\
	test-vicare-numerics-expt-compnums.sps		\
	test-vicare-numerics-max.sps			\
	test-vicare-numerics-min.sps			\
	test-vicare-numerics-abs.sps			\
	test-vicare-numerics-log.sps			\
	test-vicare-numerics-exponential.sps		\
	test-vicare-numerics-trigon-sin.sps		\
	test-vicare-numerics-trigon-cos.sps		\
	test-vicare-numerics-trigon-tan.sps		\
	test-vicare-numerics-trigon-asin.sps		\
	test-vicare-numerics-trigon-acos.sps		\
	test-vicare-numerics-trigon-atan.sps		\
	test-vicare-numerics-hyper-sinh.sps		\
	test-vicare-numerics-hyper-cosh.sps		\
	test-vicare-numerics-hyper-tanh.sps		\
	test-vicare-numerics-hyper-asinh.sps		\
	test-vicare-numerics-hyper-acosh.sps		\
	test-vicare-numerics-hyper-atanh.sps		\
	test-vicare-numerics-complex-numbers.sps	\
	test-vicare-numerics-sqrt.sps			\
	test-vicare-parameters.sps			\
	test-vicare-parser-logic.sps			\
	test-vicare-platform.sps			\
	test-vicare-pointers.sps			\
	test-vicare-promises.sps			\
	test-vicare-time.sps				\
	test-vicare-ratnums.sps				\
	test-vicare-reader.sps				\
	test-vicare-records-procedural.sps		\
	test-vicare-records-syntactic.sps		\
	test-vicare-round.sps				\
	test-vicare-shared-memory.sps			\
	test-vicare-sentinels.sps			\
	test-vicare-simple-match.sps			\
	test-vicare-string-to-number.sps		\
	test-vicare-strings.sps				\
	test-vicare-structs.sps				\
	test-vicare-symbols.sps				\
	test-vicare-syntactic-extensions.sps		\
	test-vicare-system.sps				\
	test-vicare-vectors.sps				\
	test-vicare-weak-tables.sps			\
	test-vicare-words.sps				\
	\
	test-issue-001-equal-hash.sps			\
	test-issue-003.sps				\
	test-issue-006-fxreverse-bit-field.sps		\
	test-issue-007.sps				\
	test-issue-008.sps				\
	test-issue-009.sps				\
	test-issue-010.sps				\
	test-issue-012.sps				\
	test-issue-013.sps				\
	test-issue-015.sps				\
	test-issue-017.sps				\
	test-issue-020.sps				\
	test-issue-021.sps				\
	test-issue-022.sps				\
	test-issue-023.sps				\
	test-issue-024.sps				\
	test-issue-025-sign-in-exact-rationals.sps

if WANT_SRFI
TESTS	+= \
	test-srfi-0-cond-expand.sps			\
	test-srfi-1-lists.sps				\
	test-srfi-2-and-let-star.sps			\
	test-srfi-6-basic-string-ports.sps		\
	test-srfi-8-receive.sps				\
	test-srfi-9-records.sps				\
	test-srfi-11-let-values.sps			\
	test-srfi-13-strings.sps			\
	test-srfi-14-char-sets.sps			\
	test-srfi-19-time.sps				\
	test-srfi-26-cut.sps				\
	test-srfi-27-random-bits.sps			\
	test-srfi-28-basic-format.sps			\
	test-srfi-31-rec.sps				\
	test-srfi-37-args-fold.sps			\
	test-srfi-39-parameters.sps			\
	test-srfi-41-streams.sps			\
	test-srfi-42-eager-comprehensions.sps		\
	test-srfi-43-vectors.sps			\
	test-srfi-45-lazy.sps				\
	test-srfi-48-intermediate-format-strings.sps	\
	test-srfi-61-general-cond.sps			\
	test-srfi-64-testing.sps			\
	test-srfi-67-compare-procedures.sps		\
	test-srfi-69-basic-hash-tables.sps		\
	test-srfi-78-lightweight-testing.sps		\
	test-srfi-98-os-environment-variables.sps	\
	test-srfi-101-functional-pairs.sps
endif

if WANT_LIBFFI
TESTS	+= \
	test-vicare-ffi-core.sps			\
	test-vicare-ffi-foreign-pointer-wrapper.sps
endif

if WANT_POSIX
TESTS	+= \
	test-vicare-posix-basic.sps			\
	test-vicare-posix-non-blocking.sps		\
	test-vicare-posix-close-on-exec.sps		\
	test-vicare-posix-sockets.sps			\
	test-vicare-posix-mmap.sps			\
	test-vicare-posix-bub.sps			\
	test-vicare-posix-time.sps			\
	test-vicare-posix-timers.sps			\
	test-vicare-posix-message-queue.sps		\
	test-vicare-posix-shared-memory.sps		\
	test-vicare-posix-semaphores.sps		\
	test-vicare-posix-sigwait.sps			\
	\
	test-vicare-shared-memory.sps			\
	test-vicare-posix-sel.sps			\
	test-vicare-posix-pid-files.sps			\
	test-vicare-posix-lock-pid-files.sps		\
	test-vicare-posix-log-files.sps			\
	\
	test-vicare-posix-net-channels-binary.sps	\
	test-vicare-posix-net-channels-textual.sps
endif

if WANT_GLIBC
TESTS	+= test-vicare-glibc.sps
endif

if WANT_LIBICONV
TESTS	+= test-vicare-iconv.sps
endif

if WANT_LINUX
TESTS	+= test-vicare-linux.sps
endif

if WANT_CRE2
TESTS	+= foreign-test-vicare-cre2.sps
endif

#page
#### interface to "make instcheck"

VICARE_INSTCHECK_LIBRARY_PATH = $(DESTDIR)$(VICARE_LIBDIR):$(VICARE_LIBRARY_PATH):$(srcdir):$(srcdir)/../scheme

VICARE_INSTCHECK_FLAGS	= --print-loaded-libraries $(user_flags)
VICARE_INSTCHECK_ENV	= \
	VICARE_LIBRARY_PATH=$(VICARE_INSTCHECK_LIBRARY_PATH); export VICARE_LIBRARY_PATH; \
	LD_LIBRARY_PATH=$(DESTDIR)$(libdir); export LD_LIBRARY_PATH; \
	VICARE_CHECK_QUIET=no; export VICARE_CHECK_QUIET;
VICARE_INSTCHECK_RUN	= \
	$(VICARE_INSTCHECK_ENV) $(DESTDIR)$(bindir)/vicare $(VICARE_INSTCHECK_FLAGS)

installcheck-local:
	@for f in $(TESTS); do $(VICARE_INSTCHECK_RUN) $(srcdir)/$$f; done

#page
#### extra files to be distributed

EXTRA_DIST = \
	ikarus-test-framework.sls			\
	lists.sls					\
	lists/low.sls					\
	lists/stx.sls					\
	numerics/helpers.sls				\
	TEST-SOURCE-FILE.txt				\
	rn100						\
	\
	r6rs						\
	r6rs/README.txt					\
	r6rs/arithmetic					\
	r6rs/arithmetic/bitwise.sls			\
	r6rs/arithmetic/fixnums.sls			\
	r6rs/arithmetic/flonums.sls			\
	r6rs/base.sls					\
	r6rs/bytevectors.sls				\
	r6rs/conditions.sls				\
	r6rs/contrib					\
	r6rs/contrib.sls				\
	r6rs/contrib/helper1.sls			\
	r6rs/control.sls				\
	r6rs/enums.sls					\
	r6rs/eval.sls					\
	r6rs/exceptions.sls				\
	r6rs/hashtables.sls				\
	r6rs/io						\
	r6rs/io/ports.sls				\
	r6rs/io/simple.sls				\
	r6rs/lists.sls					\
	r6rs/mutable-pairs.sls				\
	r6rs/mutable-strings.sls			\
	r6rs/programs.sls				\
	r6rs/r5rs.sls					\
	r6rs/reader.sls					\
	r6rs/records					\
	r6rs/records/procedural.sls			\
	r6rs/records/syntactic.sls			\
	r6rs/sorting.sls				\
	r6rs/syntax-case.sls				\
	r6rs/test.sls					\
	r6rs/unicode.sls				\
	\
	exec-modes-helpers/r6rs-forms			\
	exec-modes-helpers/r6rs-program.sps		\
	test-exec-modes.sh				\
	\
	demo-vicare-gcc.sps				\
	demo-vicare-readline.sps			\
	demo-vicare-timerfd.sps				\
	demo-issue-35.sps				\
	demo-tcp-connect.sps				\
	\
	long-test-r6rs-run.sps				\
	long-test-r6rs-run-via-eval.sps			\
	long-test-ikarus-bignums.sps			\
	long-test-ikarus-io.sps				\
	long-test-ikarus-parse-flonums.sps		\
	long-test-ikarus-string-to-number.sps		\
	\
	test-r6rs-arithmetic-bitwise.sps		\
	test-r6rs-arithmetic-fixnums.sps		\
	test-r6rs-arithmetic-flonums.sps		\
	test-r6rs-base.sps				\
	test-r6rs-bytevectors.sps			\
	test-r6rs-conditions.sps			\
	test-r6rs-contrib.sps				\
	test-r6rs-control.sps				\
	test-r6rs-enums.sps				\
	test-r6rs-eval.sps				\
	test-r6rs-exceptions.sps			\
	test-r6rs-hashtables.sps			\
	test-r6rs-io-ports.sps				\
	test-r6rs-io-simple.sps				\
	test-r6rs-lists.sps				\
	test-r6rs-mutable-pairs.sps			\
	test-r6rs-mutable-strings.sps			\
	test-r6rs-programs.sps				\
	test-r6rs-r5rs.sps				\
	test-r6rs-reader.sps				\
	test-r6rs-records-procedural.sps		\
	test-r6rs-records-syntactic.sps			\
	test-r6rs-sorting.sps				\
	test-r6rs-syntax-case.sps			\
	test-r6rs-unicode.sps				\
	\
	test-ikarus-bignum-to-flonum.sps		\
	test-ikarus-bitwise.sps				\
	test-ikarus-bytevectors.sps			\
	test-ikarus-case-folding.sps			\
	test-ikarus-div-and-mod.sps			\
	test-ikarus-enums.sps				\
	test-ikarus-fasl.sps				\
	test-ikarus-fixnums.sps				\
	test-ikarus-fldiv-and-mod.sps			\
	test-ikarus-guardians.sps			\
	test-ikarus-hashtables.sps			\
	test-ikarus-lists.sps				\
	test-ikarus-normalization.sps			\
	test-ikarus-numerics.sps			\
	test-ikarus-r6rs-records-procedural.sps		\
	test-ikarus-reader.sps				\
	test-ikarus-set-position.sps			\
	test-ikarus-sorting.sps				\
	test-ikarus-strings.sps				\
	test-ikarus-symbol-table.sps			\
	test-ikarus-unicode.sps				\
	\
	test-vicare-amb.sps				\
	test-vicare-arguments-validation.sps		\
	test-vicare-bignums.sps				\
	test-vicare-bytevectors.sps			\
	test-vicare-bytevector-compounds.sps		\
	test-vicare-chars.sps				\
	test-vicare-collect.sps				\
	test-vicare-compensations.sps			\
	test-vicare-cond-expand.sps			\
	test-vicare-coroutines.sps			\
	test-vicare-custom-ports.sps			\
	test-vicare-enumerations.sps			\
	test-vicare-equality.sps			\
	test-vicare-errno.sps				\
	test-vicare-expander.sps			\
	test-vicare-debugging.sps			\
	test-vicare-ffi-core.sps			\
	test-vicare-ffi-foreign-pointer-wrapper.sps	\
	test-vicare-fasl.sps				\
	test-vicare-fixnums.sps				\
	test-vicare-flonum-base.sps			\
	test-vicare-flonum-formatter.sps		\
	test-vicare-flonum-parser.sps			\
	test-vicare-general-c-buffers.sps		\
	test-vicare-glibc.sps				\
	test-vicare-keywords.sps			\
	test-vicare-iconv.sps				\
	test-vicare-infix.sps				\
	test-vicare-io.sps				\
	test-vicare-language-extensions.sps		\
	test-vicare-linux.sps				\
	test-vicare-letrec-syntax.sps			\
	test-vicare-library-utils.sps			\
	test-vicare-lists.sps				\
	test-vicare-log.sps				\
	test-vicare-namespaces.sps			\
	test-vicare-net-channels-binary.sps		\
	test-vicare-net-channels-textual.sps		\
	test-vicare-numerics-generic.sps		\
	test-vicare-numerics-neg.sps			\
	test-vicare-numerics-inv.sps			\
	test-vicare-numerics-add.sps			\
	test-vicare-numerics-sub.sps			\
	test-vicare-numerics-mul.sps			\
	test-vicare-numerics-div.sps			\
	test-vicare-numerics-gcd.sps			\
	test-vicare-numerics-lcm.sps			\
	test-vicare-numerics-quotient.sps		\
	test-vicare-numerics-remainder.sps		\
	test-vicare-numerics-modulo.sps			\
	test-vicare-numerics-square.sps			\
	test-vicare-numerics-cube.sps			\
	test-vicare-numerics-sign.sps			\
	test-vicare-numerics-expt-fixnums.sps		\
	test-vicare-numerics-expt-bignums.sps		\
	test-vicare-numerics-expt-flonums.sps		\
	test-vicare-numerics-expt-ratnums.sps		\
	test-vicare-numerics-expt-cflonums.sps		\
	test-vicare-numerics-expt-compnums.sps		\
	test-vicare-numerics-max.sps			\
	test-vicare-numerics-min.sps			\
	test-vicare-numerics-abs.sps			\
	test-vicare-numerics-log.sps			\
	test-vicare-numerics-exponential.sps		\
	test-vicare-numerics-trigon-sin.sps		\
	test-vicare-numerics-trigon-cos.sps		\
	test-vicare-numerics-trigon-tan.sps		\
	test-vicare-numerics-trigon-asin.sps		\
	test-vicare-numerics-trigon-acos.sps		\
	test-vicare-numerics-trigon-atan.sps		\
	test-vicare-numerics-hyper-sinh.sps		\
	test-vicare-numerics-hyper-cosh.sps		\
	test-vicare-numerics-hyper-tanh.sps		\
	test-vicare-numerics-hyper-asinh.sps		\
	test-vicare-numerics-hyper-acosh.sps		\
	test-vicare-numerics-hyper-atanh.sps		\
	test-vicare-numerics-complex-numbers.sps	\
	test-vicare-numerics-sqrt.sps			\
	test-vicare-parameters.sps			\
	test-vicare-parser-logic.sps			\
	test-vicare-platform.sps			\
	test-vicare-pointers.sps			\
	\
	test-vicare-posix-basic.sps			\
	test-vicare-posix-sockets.sps			\
	test-vicare-posix-non-blocking.sps		\
	test-vicare-posix-close-on-exec.sps		\
	test-vicare-posix-mmap.sps			\
	test-vicare-posix-bub.sps			\
	test-vicare-posix-time.sps			\
	test-vicare-posix-timers.sps			\
	test-vicare-posix-message-queue.sps		\
	test-vicare-posix-shared-memory.sps		\
	test-vicare-posix-semaphores.sps		\
	test-vicare-posix-sigwait.sps			\
	test-vicare-posix-log-files.sps			\
	test-vicare-posix-pid-files.sps			\
	test-vicare-posix-lock-pid-files.sps		\
	test-vicare-posix-sel.sps			\
	test-vicare-posix-net-channels-binary.sps	\
	test-vicare-posix-net-channels-textual.sps	\
	\
	test-vicare-promises.sps			\
	test-vicare-time.sps				\
	test-vicare-ratnums.sps				\
	test-vicare-reader.sps				\
	test-vicare-records-procedural.sps		\
	test-vicare-records-syntactic.sps		\
	test-vicare-round.sps				\
	test-vicare-sentinels.sps			\
	test-vicare-shared-memory.sps			\
	test-vicare-simple-match.sps			\
	test-vicare-string-to-number.sps		\
	test-vicare-strings.sps				\
	test-vicare-structs.sps				\
	test-vicare-symbols.sps				\
	test-vicare-syntactic-extensions.sps		\
	test-vicare-system.sps				\
	test-vicare-vectors.sps				\
	test-vicare-weak-tables.sps			\
	test-vicare-words.sps				\
	\
	test-srfi-0-cond-expand.sps			\
	test-srfi-1-lists.sps				\
	test-srfi-2-and-let-star.sps			\
	test-srfi-6-basic-string-ports.sps		\
	test-srfi-8-receive.sps				\
	test-srfi-9-records.sps				\
	test-srfi-11-let-values.sps			\
	test-srfi-13-strings.sps			\
	test-srfi-14-char-sets.sps			\
	test-srfi-19-time.sps				\
	test-srfi-26-cut.sps				\
	test-srfi-27-random-bits.sps			\
	test-srfi-28-basic-format.sps			\
	test-srfi-31-rec.sps				\
	test-srfi-37-args-fold.sps			\
	test-srfi-39-parameters.sps			\
	test-srfi-41-streams.sps			\
	test-srfi-42-eager-comprehensions.sps		\
	test-srfi-43-vectors.sps			\
	test-srfi-45-lazy.sps				\
	test-srfi-48-intermediate-format-strings.sps	\
	test-srfi-61-general-cond.sps			\
	test-srfi-64-testing.sps			\
	test-srfi-67-compare-procedures.sps		\
	test-srfi-69-basic-hash-tables.sps		\
	test-srfi-78-lightweight-testing.sps		\
	test-srfi-98-os-environment-variables.sps	\
	test-srfi-101-functional-pairs.sps		\
	\
	test-issue-001-equal-hash.sps			\
	test-issue-003.sps				\
	test-issue-006-fxreverse-bit-field.sps		\
	test-issue-007.sps				\
	test-issue-008.sps				\
	test-issue-009.sps				\
	test-issue-010.sps				\
	test-issue-012.sps				\
	test-issue-013.sps				\
	test-issue-015.sps				\
	test-issue-017.sps				\
	test-issue-020.sps				\
	test-issue-021.sps				\
	test-issue-022.sps				\
	test-issue-023.sps				\
	test-issue-024.sps				\
	test-issue-025-sign-in-exact-rationals.sps	\
	\
	foreign-test-vicare-cre2.sps

### end of file
