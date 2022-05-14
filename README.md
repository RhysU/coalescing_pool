coalescing\_pool
================

[![Build Status](https://circleci.com/gh/RhysU/coalescing_pool.svg?style=shield)](https://app.circleci.com/pipelines/github/RhysU/coalescing_pool)

<code>coalescing\_pool</code> is a free list-based memory pool designed for
memory-constrained situations where large, contiguous blocks are repeatedly
acquired and released.  The pool grows _as slowly as possible_ and in a way
that optimizes serving large, contiguous requests relative to the memory
resources consumed.  This policy of minimal growth and maximal contiguity makes
it differ from many other pool implementations.
<code>coalescing\_pool</code>'s simple implementation uses the Boost Intrusive
and Pointer Container libraries.
