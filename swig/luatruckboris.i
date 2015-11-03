%module truckboris_wrap
%include "std_string.i"
%include "std_vector.i"
%{
/*--SWIGINCLUDE*/
/*includes for the compiler*/
#include "HeaderParser.h"
/*--ENDSWIGINCLUDE*/
%}
namespace std {
  %template(VectorString) vector<string>;
}; 
%import "/usr/include/clang/AST/ASTConsumer.h"
%rename($ignore) *::getPtr() const;
%rename($ignore) TruckBoris::Structure::Equals(const Structure& tag);
%rename(name) getName;
%rename(type) getType;
%rename(raw) getRaw;
%rename(has_name_for_linkage) hasNameForLinkage;
%rename(has_linkage) hasLinkage;
%rename(typedef_name) getTypedefName;
%rename(tag_type) getTagType;
%rename(value) getValue;
%rename(return_type) getReturn;
%rename(is_canonical) isCanonical;
%rename(canonical_type) getCanonicalType;
%rename(source_manager) getSourceManager;
%rename(lang_opts) getLangOpts;
%rename("%(regex:/^(nb)([A-Z]+.*)/\\l\\2_num/)s") "";
%rename("%(regex:/^(get)(Function|Enum|Union|Structure|Typedef|Field|Parameter)+/\\1_nth_\\l\\2/)s") "";
%rename(get_nth_enum_constant) getConstant;
%rename("%(undercase)s") addSourceFile;
%rename("%(undercase)s") addSearchPath;
%rename("%(undercase)s") addSearchPaths;
%rename("%(undercase)s") isInitialized;
%rename("%(undercase)s") withConst;
%rename("%(undercase)s") withVolatile;
%rename("%(undercase)s") withRestrict;
%rename("%(undercase)s") isEmpty;
%rename(unqualified_type) getUnqualifiedType;
%rename(local_unqualified_type) getLocalUnqualifiedType;
%rename(locally_unqualified_single_step_desugared_type) getLocallyUnqualifiedSingleStepDesugaredType;
%rename(non_reference_type) getNonReferenceType;
%rename(source_file) getSourceFile;
%rename(headers_paths) getHeadersPaths;

%rename($ignore) TruckBoris::Function::setPtr(clang::FunctionDecl * fn);
%rename($ignore) TruckBoris::Function::getParameters() const;
%rename($ignore) TruckBoris::TagDeclaration::setPtr(clang::TagDecl * var);
%rename($ignore) TruckBoris::TagDeclaration::Equals( const TagDeclaration & tag);
%rename($ignore) TruckBoris::Typedef::setPtr(clang::TypedefDecl * var);
%rename($ignore) TruckBoris::EnumConstant::setPtr(clang::EnumConstantDecl * constant);
%rename($ignore) TruckBoris::Parameter::setPtr(clang::ParmVarDecl * var);
%rename($ignore) TruckBoris::Field::setPtr(clang::FieldDecl * var);
%rename($ignore) TruckBoris::Type::setType(const clang::QualType & type);
%rename($ignore) TruckBoris::Type::setClangQualType(const clang::QualType & type);
%rename($ignore) TruckBoris::Type::getClangQualType() const;
%rename($ignore) TruckBoris::Type::getClangTypePtr() const;
%rename($ignore) TruckBoris::Type::getClangTypeClassName() const;
%rename($ignore) TruckBoris::HeaderParser::getClasses() const;

%rename($ignore) TruckBoris::Structure::Equals(const Structure& tag);
%rename($ignore) TruckBoris::Enum::Equals(const Enum& tag);
%rename($ignore) TruckBoris::Type::Equals(const Type& tpe);
%rename($ignore) TruckBoris::Field::Equals(const Field& fld);
%rename($ignore) TruckBoris::Typedef::Equals( const Typedef& tpd);
%rename($ignore) TruckBoris::Function::Equals(const Function& fn);
%rename($ignore) TruckBoris::Parameter::Equals(const Constant& pdc);
%rename($ignore) TruckBoris::EnumConstant::Equals(const EnumConstant& cst);

%include "/usr/include/truckboris/Type.h"
%include "/usr/include/truckboris/Declarations.h"
%include "/usr/include/truckboris/Function.h"
%import "/usr/include/truckboris/HeaderElements.h"
%include "/usr/include/truckboris/HeaderParser.h"
