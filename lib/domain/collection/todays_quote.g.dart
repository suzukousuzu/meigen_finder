// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_quote.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTodaysQuoteCollection on Isar {
  IsarCollection<TodaysQuote> get todaysQuotes => this.collection();
}

const TodaysQuoteSchema = CollectionSchema(
  name: r'TodaysQuote',
  id: -477000766953755170,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'emotionalType': PropertySchema(
      id: 1,
      name: r'emotionalType',
      type: IsarType.byte,
      enumMap: _TodaysQuoteemotionalTypeEnumValueMap,
    ),
    r'quote': PropertySchema(
      id: 2,
      name: r'quote',
      type: IsarType.object,
      target: r'Quote',
    )
  },
  estimateSize: _todaysQuoteEstimateSize,
  serialize: _todaysQuoteSerialize,
  deserialize: _todaysQuoteDeserialize,
  deserializeProp: _todaysQuoteDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'Quote': QuoteSchema},
  getId: _todaysQuoteGetId,
  getLinks: _todaysQuoteGetLinks,
  attach: _todaysQuoteAttach,
  version: '3.1.0+1',
);

int _todaysQuoteEstimateSize(
  TodaysQuote object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      QuoteSchema.estimateSize(object.quote, allOffsets[Quote]!, allOffsets);
  return bytesCount;
}

void _todaysQuoteSerialize(
  TodaysQuote object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeByte(offsets[1], object.emotionalType.index);
  writer.writeObject<Quote>(
    offsets[2],
    allOffsets,
    QuoteSchema.serialize,
    object.quote,
  );
}

TodaysQuote _todaysQuoteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TodaysQuote();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.emotionalType = _TodaysQuoteemotionalTypeValueEnumMap[
          reader.readByteOrNull(offsets[1])] ??
      EmotionalType.superHappy;
  object.id = id;
  object.quote = reader.readObjectOrNull<Quote>(
        offsets[2],
        QuoteSchema.deserialize,
        allOffsets,
      ) ??
      Quote();
  return object;
}

P _todaysQuoteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (_TodaysQuoteemotionalTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          EmotionalType.superHappy) as P;
    case 2:
      return (reader.readObjectOrNull<Quote>(
            offset,
            QuoteSchema.deserialize,
            allOffsets,
          ) ??
          Quote()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TodaysQuoteemotionalTypeEnumValueMap = {
  'superHappy': 0,
  'somewhatHappy': 1,
  'normal': 2,
  'somewhatSad': 3,
  'superSad': 4,
};
const _TodaysQuoteemotionalTypeValueEnumMap = {
  0: EmotionalType.superHappy,
  1: EmotionalType.somewhatHappy,
  2: EmotionalType.normal,
  3: EmotionalType.somewhatSad,
  4: EmotionalType.superSad,
};

Id _todaysQuoteGetId(TodaysQuote object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _todaysQuoteGetLinks(TodaysQuote object) {
  return [];
}

void _todaysQuoteAttach(
    IsarCollection<dynamic> col, Id id, TodaysQuote object) {
  object.id = id;
}

extension TodaysQuoteQueryWhereSort
    on QueryBuilder<TodaysQuote, TodaysQuote, QWhere> {
  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension TodaysQuoteQueryWhere
    on QueryBuilder<TodaysQuote, TodaysQuote, QWhereClause> {
  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> createdAtEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> createdAtNotEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterWhereClause> createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TodaysQuoteQueryFilter
    on QueryBuilder<TodaysQuote, TodaysQuote, QFilterCondition> {
  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      emotionalTypeEqualTo(EmotionalType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotionalType',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      emotionalTypeGreaterThan(
    EmotionalType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emotionalType',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      emotionalTypeLessThan(
    EmotionalType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emotionalType',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition>
      emotionalTypeBetween(
    EmotionalType lower,
    EmotionalType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emotionalType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TodaysQuoteQueryObject
    on QueryBuilder<TodaysQuote, TodaysQuote, QFilterCondition> {
  QueryBuilder<TodaysQuote, TodaysQuote, QAfterFilterCondition> quote(
      FilterQuery<Quote> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'quote');
    });
  }
}

extension TodaysQuoteQueryLinks
    on QueryBuilder<TodaysQuote, TodaysQuote, QFilterCondition> {}

extension TodaysQuoteQuerySortBy
    on QueryBuilder<TodaysQuote, TodaysQuote, QSortBy> {
  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> sortByEmotionalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionalType', Sort.asc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy>
      sortByEmotionalTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionalType', Sort.desc);
    });
  }
}

extension TodaysQuoteQuerySortThenBy
    on QueryBuilder<TodaysQuote, TodaysQuote, QSortThenBy> {
  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> thenByEmotionalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionalType', Sort.asc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy>
      thenByEmotionalTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionalType', Sort.desc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TodaysQuoteQueryWhereDistinct
    on QueryBuilder<TodaysQuote, TodaysQuote, QDistinct> {
  QueryBuilder<TodaysQuote, TodaysQuote, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TodaysQuote, TodaysQuote, QDistinct> distinctByEmotionalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emotionalType');
    });
  }
}

extension TodaysQuoteQueryProperty
    on QueryBuilder<TodaysQuote, TodaysQuote, QQueryProperty> {
  QueryBuilder<TodaysQuote, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TodaysQuote, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TodaysQuote, EmotionalType, QQueryOperations>
      emotionalTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emotionalType');
    });
  }

  QueryBuilder<TodaysQuote, Quote, QQueryOperations> quoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quote');
    });
  }
}
