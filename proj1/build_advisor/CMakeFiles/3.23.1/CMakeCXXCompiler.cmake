set(CMAKE_CXX_COMPILER "/apps/all/intel-compilers/2021.4.0/compiler/2021.4.0/linux/bin/intel64/icpc")
set(CMAKE_CXX_COMPILER_ARG1 "")
set(CMAKE_CXX_COMPILER_ID "Intel")
set(CMAKE_CXX_COMPILER_VERSION "2021.4.0.20210910")
set(CMAKE_CXX_COMPILER_VERSION_INTERNAL "")
set(CMAKE_CXX_COMPILER_WRAPPER "")
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT "17")
set(CMAKE_CXX_EXTENSIONS_COMPUTED_DEFAULT "ON")
set(CMAKE_CXX_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20")
set(CMAKE_CXX98_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters")
set(CMAKE_CXX11_COMPILE_FEATURES "cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates")
set(CMAKE_CXX14_COMPILE_FEATURES "cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates")
set(CMAKE_CXX17_COMPILE_FEATURES "cxx_std_17")
set(CMAKE_CXX20_COMPILE_FEATURES "cxx_std_20")
set(CMAKE_CXX23_COMPILE_FEATURES "")

set(CMAKE_CXX_PLATFORM_ID "Linux")
set(CMAKE_CXX_SIMULATE_ID "GNU")
set(CMAKE_CXX_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_CXX_SIMULATE_VERSION "11.2.0")




set(CMAKE_AR "/apps/all/binutils/2.37-GCCcore-11.2.0/bin/ar")
set(CMAKE_CXX_COMPILER_AR "")
set(CMAKE_RANLIB "/apps/all/binutils/2.37-GCCcore-11.2.0/bin/ranlib")
set(CMAKE_CXX_COMPILER_RANLIB "")
set(CMAKE_LINKER "/apps/all/binutils/2.37-GCCcore-11.2.0/bin/ld")
set(CMAKE_MT "")
set(CMAKE_COMPILER_IS_GNUCXX )
set(CMAKE_CXX_COMPILER_LOADED 1)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_ABI_COMPILED TRUE)

set(CMAKE_CXX_COMPILER_ENV_VAR "CXX")

set(CMAKE_CXX_COMPILER_ID_RUN 1)
set(CMAKE_CXX_SOURCE_FILE_EXTENSIONS C;M;c++;cc;cpp;cxx;m;mm;mpp;CPP;ixx;cppm)
set(CMAKE_CXX_IGNORE_EXTENSIONS inl;h;hpp;HPP;H;o;O;obj;OBJ;def;DEF;rc;RC)

foreach (lang C OBJC OBJCXX)
  if (CMAKE_${lang}_COMPILER_ID_RUN)
    foreach(extension IN LISTS CMAKE_${lang}_SOURCE_FILE_EXTENSIONS)
      list(REMOVE_ITEM CMAKE_CXX_SOURCE_FILE_EXTENSIONS ${extension})
    endforeach()
  endif()
endforeach()

set(CMAKE_CXX_LINKER_PREFERENCE 30)
set(CMAKE_CXX_LINKER_PREFERENCE_PROPAGATES 1)

# Save compiler ABI information.
set(CMAKE_CXX_SIZEOF_DATA_PTR "8")
set(CMAKE_CXX_COMPILER_ABI "ELF")
set(CMAKE_CXX_BYTE_ORDER "LITTLE_ENDIAN")
set(CMAKE_CXX_LIBRARY_ARCHITECTURE "")

if(CMAKE_CXX_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_CXX_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_CXX_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_CXX_COMPILER_ABI}")
endif()

if(CMAKE_CXX_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_CXX_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES "/apps/all/GTK3/3.24.31-GCCcore-11.2.0/include;/apps/all/libepoxy/1.5.8-GCCcore-11.2.0/include;/apps/all/Mesa/21.1.7-GCCcore-11.2.0/include;/apps/all/LLVM/12.0.1-GCCcore-11.2.0/include;/apps/all/zlib/1.2.11-GCCcore-11.2.0/include;/apps/all/ncurses/6.2-GCCcore-11.2.0/include;/apps/all/libunwind/1.5.0-GCCcore-11.2.0/include;/apps/all/XZ/5.2.5-GCCcore-11.2.0/include;/apps/all/libglvnd/1.3.3-GCCcore-11.2.0/include;/apps/all/X11/20210802-GCCcore-11.2.0/include;/apps/all/libdrm/2.4.107-GCCcore-11.2.0/include;/apps/all/zstd/1.5.0-GCCcore-11.2.0/include;/apps/all/Gdk-Pixbuf/2.42.6-GCCcore-11.2.0/include;/apps/all/LibTIFF/4.3.0-GCCcore-11.2.0/include;/apps/all/lz4/1.9.3-GCCcore-11.2.0/include;/apps/all/jbigkit/2.1-GCCcore-11.2.0/include;/apps/all/libjpeg-turbo/2.0.6-GCCcore-11.2.0/include;/apps/all/libpng/1.6.37-GCCcore-11.2.0/include;/apps/all/GLib/2.69.1-GCCcore-11.2.0/include;/apps/all/at-spi2-atk/2.38.0-GCCcore-11.2.0/include;/apps/all/at-spi2-core/2.40.3-GCCcore-11.2.0/include;/apps/all/DBus/1.13.18-GCCcore-11.2.0/include;/apps/all/ATK/2.36.0-GCCcore-11.2.0/include;/apps/all/Pango/1.48.8-GCCcore-11.2.0/include;/apps/all/FriBidi/1.0.10-GCCcore-11.2.0/include;/apps/all/HarfBuzz/2.8.2-GCCcore-11.2.0/include;/apps/all/cairo/1.16.0-GCCcore-11.2.0/include;/apps/all/freetype/2.11.0-GCCcore-11.2.0/include/freetype2;/apps/all/ICU/69.1-GCCcore-11.2.0/include;/apps/all/expat/2.4.1-GCCcore-11.2.0/include;/apps/all/pixman/0.40.0-GCCcore-11.2.0/include;/apps/all/bzip2/1.0.8-GCCcore-11.2.0/include;/apps/all/util-linux/2.37-GCCcore-11.2.0/include;/apps/all/PCRE/8.45-GCCcore-11.2.0/include;/apps/all/gettext/0.21-GCCcore-11.2.0/include;/apps/all/libxml2/2.9.10-GCCcore-11.2.0/include/libxml2;/apps/all/libxml2/2.9.10-GCCcore-11.2.0/include;/apps/all/libffi/3.4.2-GCCcore-11.2.0/include;/apps/all/libpciaccess/0.16-GCCcore-11.2.0/include;/apps/all/fontconfig/2.13.94-GCCcore-11.2.0/include;/apps/all/Brotli/1.0.9-GCCcore-11.2.0/include;/apps/all/imkl/2021.4.0/mkl/2021.4.0/include/fftw;/apps/all/imkl/2021.4.0/mkl/2021.4.0/include;/apps/all/impi/2021.4.0-intel-compilers-2021.4.0/mpi/2021.4.0/include;/apps/all/UCX/1.11.2-GCCcore-11.2.0/include;/apps/all/numactl/2.0.14-GCCcore-11.2.0/include;/apps/all/intel-compilers/2021.4.0/tbb/2021.4.0/include;/apps/all/binutils/2.37-GCCcore-11.2.0/include;/apps/all/GTK2/2.24.33-GCCcore-10.3.0/include;/apps/all/PCRE2/10.36-GCCcore-10.3.0/include;/apps/all/libarchive/3.6.1-GCCcore-11.3.0/include;/apps/all/cURL/7.83.0-GCCcore-11.3.0/include;/apps/all/OpenSSL/1.1/include;/apps/all/intel-compilers/2021.4.0/compiler/2021.4.0/linux/compiler/include/intel64;/apps/all/intel-compilers/2021.4.0/compiler/2021.4.0/linux/compiler/include/icc;/apps/all/intel-compilers/2021.4.0/compiler/2021.4.0/linux/compiler/include;/apps/all/GCCcore/11.2.0/include/c++/11.2.0;/apps/all/GCCcore/11.2.0/include/c++/11.2.0/x86_64-pc-linux-gnu;/apps/all/GCCcore/11.2.0/include/c++/11.2.0/backward;/usr/local/include;/apps/all/GCCcore/11.2.0/lib/gcc/x86_64-pc-linux-gnu/11.2.0/include;/apps/all/GCCcore/11.2.0/include;/usr/include")
set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "imf;svml;irng;stdc++;m;ipgo;decimal;cilkrts;stdc++;gcc;gcc_s;irc;svml;c;gcc;gcc_s;irc_s;dl;c")
set(CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES "/apps/all/GTK3/3.24.31-GCCcore-11.2.0/lib;/apps/all/libepoxy/1.5.8-GCCcore-11.2.0/lib;/apps/all/Mesa/21.1.7-GCCcore-11.2.0/lib;/apps/all/LLVM/12.0.1-GCCcore-11.2.0/lib;/apps/all/zlib/1.2.11-GCCcore-11.2.0/lib;/apps/all/ncurses/6.2-GCCcore-11.2.0/lib;/apps/all/libunwind/1.5.0-GCCcore-11.2.0/lib;/apps/all/XZ/5.2.5-GCCcore-11.2.0/lib;/apps/all/libglvnd/1.3.3-GCCcore-11.2.0/lib;/apps/all/X11/20210802-GCCcore-11.2.0/lib;/apps/all/libdrm/2.4.107-GCCcore-11.2.0/lib;/apps/all/zstd/1.5.0-GCCcore-11.2.0/lib;/apps/all/Gdk-Pixbuf/2.42.6-GCCcore-11.2.0/lib;/apps/all/LibTIFF/4.3.0-GCCcore-11.2.0/lib;/apps/all/lz4/1.9.3-GCCcore-11.2.0/lib;/apps/all/jbigkit/2.1-GCCcore-11.2.0/lib;/apps/all/libjpeg-turbo/2.0.6-GCCcore-11.2.0/lib;/apps/all/libpng/1.6.37-GCCcore-11.2.0/lib;/apps/all/GLib/2.69.1-GCCcore-11.2.0/lib;/apps/all/at-spi2-atk/2.38.0-GCCcore-11.2.0/lib;/apps/all/at-spi2-core/2.40.3-GCCcore-11.2.0/lib;/apps/all/DBus/1.13.18-GCCcore-11.2.0/lib;/apps/all/ATK/2.36.0-GCCcore-11.2.0/lib;/apps/all/Pango/1.48.8-GCCcore-11.2.0/lib;/apps/all/FriBidi/1.0.10-GCCcore-11.2.0/lib;/apps/all/HarfBuzz/2.8.2-GCCcore-11.2.0/lib;/apps/all/cairo/1.16.0-GCCcore-11.2.0/lib;/apps/all/freetype/2.11.0-GCCcore-11.2.0/lib;/apps/all/ICU/69.1-GCCcore-11.2.0/lib;/apps/all/expat/2.4.1-GCCcore-11.2.0/lib;/apps/all/pixman/0.40.0-GCCcore-11.2.0/lib;/apps/all/bzip2/1.0.8-GCCcore-11.2.0/lib;/apps/all/util-linux/2.37-GCCcore-11.2.0/lib;/apps/all/PCRE/8.45-GCCcore-11.2.0/lib;/apps/all/gettext/0.21-GCCcore-11.2.0/lib;/apps/all/libxml2/2.9.10-GCCcore-11.2.0/lib;/apps/all/libffi/3.4.2-GCCcore-11.2.0/lib64;/apps/all/libffi/3.4.2-GCCcore-11.2.0/lib;/apps/all/libpciaccess/0.16-GCCcore-11.2.0/lib;/apps/all/fontconfig/2.13.94-GCCcore-11.2.0/lib;/apps/all/Brotli/1.0.9-GCCcore-11.2.0/lib;/apps/all/imkl-FFTW/2021.4.0-iimpi-2021b/lib;/apps/all/imkl/2021.4.0/mkl/2021.4.0/lib/intel64;/apps/all/imkl/2021.4.0/compiler/2021.4.0/linux/compiler/lib/intel64_lin;/apps/all/impi/2021.4.0-intel-compilers-2021.4.0/mpi/2021.4.0/libfabric/lib;/apps/all/impi/2021.4.0-intel-compilers-2021.4.0/mpi/2021.4.0/lib/release;/apps/all/impi/2021.4.0-intel-compilers-2021.4.0/mpi/2021.4.0/lib;/apps/all/UCX/1.11.2-GCCcore-11.2.0/lib;/apps/all/numactl/2.0.14-GCCcore-11.2.0/lib;/apps/all/intel-compilers/2021.4.0/tbb/2021.4.0/lib/intel64/gcc4.8;/apps/all/intel-compilers/2021.4.0/compiler/2021.4.0/linux/compiler/lib/intel64_lin;/apps/all/intel-compilers/2021.4.0/compiler/2021.4.0/linux/lib/x64;/apps/all/intel-compilers/2021.4.0/compiler/2021.4.0/linux/lib;/apps/all/binutils/2.37-GCCcore-11.2.0/lib;/apps/all/GTK2/2.24.33-GCCcore-10.3.0/lib;/apps/all/PCRE2/10.36-GCCcore-10.3.0/lib;/apps/all/libarchive/3.6.1-GCCcore-11.3.0/lib;/apps/all/cURL/7.83.0-GCCcore-11.3.0/lib;/apps/all/OpenSSL/1.1/lib;/apps/all/GTK3/3.24.31-GCCcore-11.2.0/lib64;/apps/all/libepoxy/1.5.8-GCCcore-11.2.0/lib64;/apps/all/Mesa/21.1.7-GCCcore-11.2.0/lib64;/apps/all/LLVM/12.0.1-GCCcore-11.2.0/lib64;/apps/all/zlib/1.2.11-GCCcore-11.2.0/lib64;/apps/all/ncurses/6.2-GCCcore-11.2.0/lib64;/apps/all/libunwind/1.5.0-GCCcore-11.2.0/lib64;/apps/all/XZ/5.2.5-GCCcore-11.2.0/lib64;/apps/all/libglvnd/1.3.3-GCCcore-11.2.0/lib64;/apps/all/X11/20210802-GCCcore-11.2.0/lib64;/apps/all/libdrm/2.4.107-GCCcore-11.2.0/lib64;/apps/all/zstd/1.5.0-GCCcore-11.2.0/lib64;/apps/all/Gdk-Pixbuf/2.42.6-GCCcore-11.2.0/lib64;/apps/all/LibTIFF/4.3.0-GCCcore-11.2.0/lib64;/apps/all/lz4/1.9.3-GCCcore-11.2.0/lib64;/apps/all/jbigkit/2.1-GCCcore-11.2.0/lib64;/apps/all/libjpeg-turbo/2.0.6-GCCcore-11.2.0/lib64;/apps/all/libpng/1.6.37-GCCcore-11.2.0/lib64;/apps/all/GLib/2.69.1-GCCcore-11.2.0/lib64;/apps/all/at-spi2-atk/2.38.0-GCCcore-11.2.0/lib64;/apps/all/at-spi2-core/2.40.3-GCCcore-11.2.0/lib64;/apps/all/DBus/1.13.18-GCCcore-11.2.0/lib64;/apps/all/ATK/2.36.0-GCCcore-11.2.0/lib64;/apps/all/Pango/1.48.8-GCCcore-11.2.0/lib64;/apps/all/FriBidi/1.0.10-GCCcore-11.2.0/lib64;/apps/all/HarfBuzz/2.8.2-GCCcore-11.2.0/lib64;/apps/all/cairo/1.16.0-GCCcore-11.2.0/lib64;/apps/all/freetype/2.11.0-GCCcore-11.2.0/lib64;/apps/all/ICU/69.1-GCCcore-11.2.0/lib64;/apps/all/expat/2.4.1-GCCcore-11.2.0/lib64;/apps/all/pixman/0.40.0-GCCcore-11.2.0/lib64;/apps/all/bzip2/1.0.8-GCCcore-11.2.0/lib64;/apps/all/util-linux/2.37-GCCcore-11.2.0/lib64;/apps/all/PCRE/8.45-GCCcore-11.2.0/lib64;/apps/all/gettext/0.21-GCCcore-11.2.0/lib64;/apps/all/libxml2/2.9.10-GCCcore-11.2.0/lib64;/apps/all/libpciaccess/0.16-GCCcore-11.2.0/lib64;/apps/all/fontconfig/2.13.94-GCCcore-11.2.0/lib64;/apps/all/Brotli/1.0.9-GCCcore-11.2.0/lib64;/apps/all/UCX/1.11.2-GCCcore-11.2.0/lib64;/apps/all/numactl/2.0.14-GCCcore-11.2.0/lib64;/apps/all/binutils/2.37-GCCcore-11.2.0/lib64;/apps/all/GTK2/2.24.33-GCCcore-10.3.0/lib64;/apps/all/PCRE2/10.36-GCCcore-10.3.0/lib64;/apps/all/libarchive/3.6.1-GCCcore-11.3.0/lib64;/apps/all/cURL/7.83.0-GCCcore-11.3.0/lib64;/apps/all/OpenSSL/1.1/lib64;/apps/all/GCCcore/11.2.0/lib/gcc/x86_64-pc-linux-gnu/11.2.0;/apps/all/GCCcore/11.2.0/lib64;/lib64;/usr/lib64;/apps/all/GCCcore/11.2.0/lib;/lib;/usr/lib")
set(CMAKE_CXX_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
