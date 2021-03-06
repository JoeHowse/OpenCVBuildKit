// -*- C++ -*-
//===----------------------------------------------------------------------===//
//
// Copyright (C) 2017-2019 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// This file incorporates work covered by the following copyright and permission
// notice:
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
//
//===----------------------------------------------------------------------===//

#ifndef _PSTL_GLUE_EXECUTION_DEFS_H
#define _PSTL_GLUE_EXECUTION_DEFS_H

#include <type_traits>

#include "execution_defs.h"

namespace std
{
// Type trait
using pstl::execution::is_execution_policy;
#if _PSTL_CPP14_VARIABLE_TEMPLATES_PRESENT
#    if __INTEL_COMPILER
template <class T>
constexpr bool is_execution_policy_v = is_execution_policy<T>::value;
#    else
using pstl::execution::is_execution_policy_v;
#    endif
#endif

namespace execution
{
// Standard C++ policy classes
using pstl::execution::sequenced_policy;
#if _PSTL_USE_PAR_POLICIES
using pstl::execution::parallel_policy;
using pstl::execution::parallel_unsequenced_policy;
#endif
// Standard predefined policy instances
using pstl::execution::seq;
#if _PSTL_USE_PAR_POLICIES
using pstl::execution::par;
using pstl::execution::par_unseq;
#endif
// Implementation-defined names
// Unsequenced policy is not yet standard, but for consistency
// we include it into namespace std::execution as well
using pstl::execution::unseq;
using pstl::execution::unsequenced_policy;
} // namespace execution
} // namespace std

#include "algorithm_impl.h"
#include "numeric_impl.h"
#include "parallel_backend.h"

#endif /* _PSTL_GLUE_EXECUTION_DEFS_H */
