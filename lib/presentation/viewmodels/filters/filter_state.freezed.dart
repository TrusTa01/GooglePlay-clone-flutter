// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterState {

 String get selectedGameCategory; String get selectedAppCategory; String get selectedBookGenre; String get selectedTopFilter; String get selectedRecentFilter; String get selectedAgeFilter; String get selectedRatingFilter; String get selectedLanguageFilter; String get selectedAbridgetVersionFilter; List<String> get selectedKidsFilters; bool get isFilterOnlyMode; bool get isCategoryOverviewMode;
/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterStateCopyWith<FilterState> get copyWith => _$FilterStateCopyWithImpl<FilterState>(this as FilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterState&&(identical(other.selectedGameCategory, selectedGameCategory) || other.selectedGameCategory == selectedGameCategory)&&(identical(other.selectedAppCategory, selectedAppCategory) || other.selectedAppCategory == selectedAppCategory)&&(identical(other.selectedBookGenre, selectedBookGenre) || other.selectedBookGenre == selectedBookGenre)&&(identical(other.selectedTopFilter, selectedTopFilter) || other.selectedTopFilter == selectedTopFilter)&&(identical(other.selectedRecentFilter, selectedRecentFilter) || other.selectedRecentFilter == selectedRecentFilter)&&(identical(other.selectedAgeFilter, selectedAgeFilter) || other.selectedAgeFilter == selectedAgeFilter)&&(identical(other.selectedRatingFilter, selectedRatingFilter) || other.selectedRatingFilter == selectedRatingFilter)&&(identical(other.selectedLanguageFilter, selectedLanguageFilter) || other.selectedLanguageFilter == selectedLanguageFilter)&&(identical(other.selectedAbridgetVersionFilter, selectedAbridgetVersionFilter) || other.selectedAbridgetVersionFilter == selectedAbridgetVersionFilter)&&const DeepCollectionEquality().equals(other.selectedKidsFilters, selectedKidsFilters)&&(identical(other.isFilterOnlyMode, isFilterOnlyMode) || other.isFilterOnlyMode == isFilterOnlyMode)&&(identical(other.isCategoryOverviewMode, isCategoryOverviewMode) || other.isCategoryOverviewMode == isCategoryOverviewMode));
}


@override
int get hashCode => Object.hash(runtimeType,selectedGameCategory,selectedAppCategory,selectedBookGenre,selectedTopFilter,selectedRecentFilter,selectedAgeFilter,selectedRatingFilter,selectedLanguageFilter,selectedAbridgetVersionFilter,const DeepCollectionEquality().hash(selectedKidsFilters),isFilterOnlyMode,isCategoryOverviewMode);

@override
String toString() {
  return 'FilterState(selectedGameCategory: $selectedGameCategory, selectedAppCategory: $selectedAppCategory, selectedBookGenre: $selectedBookGenre, selectedTopFilter: $selectedTopFilter, selectedRecentFilter: $selectedRecentFilter, selectedAgeFilter: $selectedAgeFilter, selectedRatingFilter: $selectedRatingFilter, selectedLanguageFilter: $selectedLanguageFilter, selectedAbridgetVersionFilter: $selectedAbridgetVersionFilter, selectedKidsFilters: $selectedKidsFilters, isFilterOnlyMode: $isFilterOnlyMode, isCategoryOverviewMode: $isCategoryOverviewMode)';
}


}

/// @nodoc
abstract mixin class $FilterStateCopyWith<$Res>  {
  factory $FilterStateCopyWith(FilterState value, $Res Function(FilterState) _then) = _$FilterStateCopyWithImpl;
@useResult
$Res call({
 String selectedGameCategory, String selectedAppCategory, String selectedBookGenre, String selectedTopFilter, String selectedRecentFilter, String selectedAgeFilter, String selectedRatingFilter, String selectedLanguageFilter, String selectedAbridgetVersionFilter, List<String> selectedKidsFilters, bool isFilterOnlyMode, bool isCategoryOverviewMode
});




}
/// @nodoc
class _$FilterStateCopyWithImpl<$Res>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._self, this._then);

  final FilterState _self;
  final $Res Function(FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedGameCategory = null,Object? selectedAppCategory = null,Object? selectedBookGenre = null,Object? selectedTopFilter = null,Object? selectedRecentFilter = null,Object? selectedAgeFilter = null,Object? selectedRatingFilter = null,Object? selectedLanguageFilter = null,Object? selectedAbridgetVersionFilter = null,Object? selectedKidsFilters = null,Object? isFilterOnlyMode = null,Object? isCategoryOverviewMode = null,}) {
  return _then(_self.copyWith(
selectedGameCategory: null == selectedGameCategory ? _self.selectedGameCategory : selectedGameCategory // ignore: cast_nullable_to_non_nullable
as String,selectedAppCategory: null == selectedAppCategory ? _self.selectedAppCategory : selectedAppCategory // ignore: cast_nullable_to_non_nullable
as String,selectedBookGenre: null == selectedBookGenre ? _self.selectedBookGenre : selectedBookGenre // ignore: cast_nullable_to_non_nullable
as String,selectedTopFilter: null == selectedTopFilter ? _self.selectedTopFilter : selectedTopFilter // ignore: cast_nullable_to_non_nullable
as String,selectedRecentFilter: null == selectedRecentFilter ? _self.selectedRecentFilter : selectedRecentFilter // ignore: cast_nullable_to_non_nullable
as String,selectedAgeFilter: null == selectedAgeFilter ? _self.selectedAgeFilter : selectedAgeFilter // ignore: cast_nullable_to_non_nullable
as String,selectedRatingFilter: null == selectedRatingFilter ? _self.selectedRatingFilter : selectedRatingFilter // ignore: cast_nullable_to_non_nullable
as String,selectedLanguageFilter: null == selectedLanguageFilter ? _self.selectedLanguageFilter : selectedLanguageFilter // ignore: cast_nullable_to_non_nullable
as String,selectedAbridgetVersionFilter: null == selectedAbridgetVersionFilter ? _self.selectedAbridgetVersionFilter : selectedAbridgetVersionFilter // ignore: cast_nullable_to_non_nullable
as String,selectedKidsFilters: null == selectedKidsFilters ? _self.selectedKidsFilters : selectedKidsFilters // ignore: cast_nullable_to_non_nullable
as List<String>,isFilterOnlyMode: null == isFilterOnlyMode ? _self.isFilterOnlyMode : isFilterOnlyMode // ignore: cast_nullable_to_non_nullable
as bool,isCategoryOverviewMode: null == isCategoryOverviewMode ? _self.isCategoryOverviewMode : isCategoryOverviewMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterState].
extension FilterStatePatterns on FilterState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterState value)  $default,){
final _that = this;
switch (_that) {
case _FilterState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterState value)?  $default,){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedGameCategory,  String selectedAppCategory,  String selectedBookGenre,  String selectedTopFilter,  String selectedRecentFilter,  String selectedAgeFilter,  String selectedRatingFilter,  String selectedLanguageFilter,  String selectedAbridgetVersionFilter,  List<String> selectedKidsFilters,  bool isFilterOnlyMode,  bool isCategoryOverviewMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.selectedGameCategory,_that.selectedAppCategory,_that.selectedBookGenre,_that.selectedTopFilter,_that.selectedRecentFilter,_that.selectedAgeFilter,_that.selectedRatingFilter,_that.selectedLanguageFilter,_that.selectedAbridgetVersionFilter,_that.selectedKidsFilters,_that.isFilterOnlyMode,_that.isCategoryOverviewMode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedGameCategory,  String selectedAppCategory,  String selectedBookGenre,  String selectedTopFilter,  String selectedRecentFilter,  String selectedAgeFilter,  String selectedRatingFilter,  String selectedLanguageFilter,  String selectedAbridgetVersionFilter,  List<String> selectedKidsFilters,  bool isFilterOnlyMode,  bool isCategoryOverviewMode)  $default,) {final _that = this;
switch (_that) {
case _FilterState():
return $default(_that.selectedGameCategory,_that.selectedAppCategory,_that.selectedBookGenre,_that.selectedTopFilter,_that.selectedRecentFilter,_that.selectedAgeFilter,_that.selectedRatingFilter,_that.selectedLanguageFilter,_that.selectedAbridgetVersionFilter,_that.selectedKidsFilters,_that.isFilterOnlyMode,_that.isCategoryOverviewMode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedGameCategory,  String selectedAppCategory,  String selectedBookGenre,  String selectedTopFilter,  String selectedRecentFilter,  String selectedAgeFilter,  String selectedRatingFilter,  String selectedLanguageFilter,  String selectedAbridgetVersionFilter,  List<String> selectedKidsFilters,  bool isFilterOnlyMode,  bool isCategoryOverviewMode)?  $default,) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.selectedGameCategory,_that.selectedAppCategory,_that.selectedBookGenre,_that.selectedTopFilter,_that.selectedRecentFilter,_that.selectedAgeFilter,_that.selectedRatingFilter,_that.selectedLanguageFilter,_that.selectedAbridgetVersionFilter,_that.selectedKidsFilters,_that.isFilterOnlyMode,_that.isCategoryOverviewMode);case _:
  return null;

}
}

}

/// @nodoc


class _FilterState extends FilterState {
  const _FilterState({this.selectedGameCategory = 'categoryAll', this.selectedAppCategory = 'categoryAll', this.selectedBookGenre = 'categoryBooksAll', this.selectedTopFilter = 'filterTopFreeOption', this.selectedRecentFilter = 'filterRecent', this.selectedAgeFilter = 'filterAll', this.selectedRatingFilter = 'ratingAll', this.selectedLanguageFilter = 'filterAll', this.selectedAbridgetVersionFilter = 'filterAll', final  List<String> selectedKidsFilters = const ['ageUnder5', 'age6to8', 'age9to12', 'age13plus'], this.isFilterOnlyMode = false, this.isCategoryOverviewMode = false}): _selectedKidsFilters = selectedKidsFilters,super._();
  

@override@JsonKey() final  String selectedGameCategory;
@override@JsonKey() final  String selectedAppCategory;
@override@JsonKey() final  String selectedBookGenre;
@override@JsonKey() final  String selectedTopFilter;
@override@JsonKey() final  String selectedRecentFilter;
@override@JsonKey() final  String selectedAgeFilter;
@override@JsonKey() final  String selectedRatingFilter;
@override@JsonKey() final  String selectedLanguageFilter;
@override@JsonKey() final  String selectedAbridgetVersionFilter;
 final  List<String> _selectedKidsFilters;
@override@JsonKey() List<String> get selectedKidsFilters {
  if (_selectedKidsFilters is EqualUnmodifiableListView) return _selectedKidsFilters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedKidsFilters);
}

@override@JsonKey() final  bool isFilterOnlyMode;
@override@JsonKey() final  bool isCategoryOverviewMode;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterStateCopyWith<_FilterState> get copyWith => __$FilterStateCopyWithImpl<_FilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterState&&(identical(other.selectedGameCategory, selectedGameCategory) || other.selectedGameCategory == selectedGameCategory)&&(identical(other.selectedAppCategory, selectedAppCategory) || other.selectedAppCategory == selectedAppCategory)&&(identical(other.selectedBookGenre, selectedBookGenre) || other.selectedBookGenre == selectedBookGenre)&&(identical(other.selectedTopFilter, selectedTopFilter) || other.selectedTopFilter == selectedTopFilter)&&(identical(other.selectedRecentFilter, selectedRecentFilter) || other.selectedRecentFilter == selectedRecentFilter)&&(identical(other.selectedAgeFilter, selectedAgeFilter) || other.selectedAgeFilter == selectedAgeFilter)&&(identical(other.selectedRatingFilter, selectedRatingFilter) || other.selectedRatingFilter == selectedRatingFilter)&&(identical(other.selectedLanguageFilter, selectedLanguageFilter) || other.selectedLanguageFilter == selectedLanguageFilter)&&(identical(other.selectedAbridgetVersionFilter, selectedAbridgetVersionFilter) || other.selectedAbridgetVersionFilter == selectedAbridgetVersionFilter)&&const DeepCollectionEquality().equals(other._selectedKidsFilters, _selectedKidsFilters)&&(identical(other.isFilterOnlyMode, isFilterOnlyMode) || other.isFilterOnlyMode == isFilterOnlyMode)&&(identical(other.isCategoryOverviewMode, isCategoryOverviewMode) || other.isCategoryOverviewMode == isCategoryOverviewMode));
}


@override
int get hashCode => Object.hash(runtimeType,selectedGameCategory,selectedAppCategory,selectedBookGenre,selectedTopFilter,selectedRecentFilter,selectedAgeFilter,selectedRatingFilter,selectedLanguageFilter,selectedAbridgetVersionFilter,const DeepCollectionEquality().hash(_selectedKidsFilters),isFilterOnlyMode,isCategoryOverviewMode);

@override
String toString() {
  return 'FilterState(selectedGameCategory: $selectedGameCategory, selectedAppCategory: $selectedAppCategory, selectedBookGenre: $selectedBookGenre, selectedTopFilter: $selectedTopFilter, selectedRecentFilter: $selectedRecentFilter, selectedAgeFilter: $selectedAgeFilter, selectedRatingFilter: $selectedRatingFilter, selectedLanguageFilter: $selectedLanguageFilter, selectedAbridgetVersionFilter: $selectedAbridgetVersionFilter, selectedKidsFilters: $selectedKidsFilters, isFilterOnlyMode: $isFilterOnlyMode, isCategoryOverviewMode: $isCategoryOverviewMode)';
}


}

/// @nodoc
abstract mixin class _$FilterStateCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(_FilterState value, $Res Function(_FilterState) _then) = __$FilterStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedGameCategory, String selectedAppCategory, String selectedBookGenre, String selectedTopFilter, String selectedRecentFilter, String selectedAgeFilter, String selectedRatingFilter, String selectedLanguageFilter, String selectedAbridgetVersionFilter, List<String> selectedKidsFilters, bool isFilterOnlyMode, bool isCategoryOverviewMode
});




}
/// @nodoc
class __$FilterStateCopyWithImpl<$Res>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(this._self, this._then);

  final _FilterState _self;
  final $Res Function(_FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedGameCategory = null,Object? selectedAppCategory = null,Object? selectedBookGenre = null,Object? selectedTopFilter = null,Object? selectedRecentFilter = null,Object? selectedAgeFilter = null,Object? selectedRatingFilter = null,Object? selectedLanguageFilter = null,Object? selectedAbridgetVersionFilter = null,Object? selectedKidsFilters = null,Object? isFilterOnlyMode = null,Object? isCategoryOverviewMode = null,}) {
  return _then(_FilterState(
selectedGameCategory: null == selectedGameCategory ? _self.selectedGameCategory : selectedGameCategory // ignore: cast_nullable_to_non_nullable
as String,selectedAppCategory: null == selectedAppCategory ? _self.selectedAppCategory : selectedAppCategory // ignore: cast_nullable_to_non_nullable
as String,selectedBookGenre: null == selectedBookGenre ? _self.selectedBookGenre : selectedBookGenre // ignore: cast_nullable_to_non_nullable
as String,selectedTopFilter: null == selectedTopFilter ? _self.selectedTopFilter : selectedTopFilter // ignore: cast_nullable_to_non_nullable
as String,selectedRecentFilter: null == selectedRecentFilter ? _self.selectedRecentFilter : selectedRecentFilter // ignore: cast_nullable_to_non_nullable
as String,selectedAgeFilter: null == selectedAgeFilter ? _self.selectedAgeFilter : selectedAgeFilter // ignore: cast_nullable_to_non_nullable
as String,selectedRatingFilter: null == selectedRatingFilter ? _self.selectedRatingFilter : selectedRatingFilter // ignore: cast_nullable_to_non_nullable
as String,selectedLanguageFilter: null == selectedLanguageFilter ? _self.selectedLanguageFilter : selectedLanguageFilter // ignore: cast_nullable_to_non_nullable
as String,selectedAbridgetVersionFilter: null == selectedAbridgetVersionFilter ? _self.selectedAbridgetVersionFilter : selectedAbridgetVersionFilter // ignore: cast_nullable_to_non_nullable
as String,selectedKidsFilters: null == selectedKidsFilters ? _self._selectedKidsFilters : selectedKidsFilters // ignore: cast_nullable_to_non_nullable
as List<String>,isFilterOnlyMode: null == isFilterOnlyMode ? _self.isFilterOnlyMode : isFilterOnlyMode // ignore: cast_nullable_to_non_nullable
as bool,isCategoryOverviewMode: null == isCategoryOverviewMode ? _self.isCategoryOverviewMode : isCategoryOverviewMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
