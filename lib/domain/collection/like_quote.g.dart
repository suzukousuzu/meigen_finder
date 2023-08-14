// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_quote.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLikeQuoteCollection on Isar {
  IsarCollection<LikeQuote> get likeQuotes => this.collection();
}

const LikeQuoteSchema = CollectionSchema(
  name: r'LikeQuote',
  id: -8453078227287074400,
  properties: {
    r'likeQuotes': PropertySchema(
      id: 0,
      name: r'likeQuotes',
      type: IsarType.object,
      target: r'Quote',
    )
  },
  estimateSize: _likeQuoteEstimateSize,
  serialize: _likeQuoteSerialize,
  deserialize: _likeQuoteDeserialize,
  deserializeProp: _likeQuoteDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Quote': QuoteSchema},
  getId: _likeQuoteGetId,
  getLinks: _likeQuoteGetLinks,
  attach: _likeQuoteAttach,
  version: '3.1.0+1',
);

int _likeQuoteEstimateSize(
  LikeQuote object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      QuoteSchema.estimateSize(
          object.likeQuotes, allOffsets[Quote]!, allOffsets);
  return bytesCount;
}

void _likeQuoteSerialize(
  LikeQuote object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Quote>(
    offsets[0],
    allOffsets,
    QuoteSchema.serialize,
    object.likeQuotes,
  );
}

LikeQuote _likeQuoteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LikeQuote();
  object.id = id;
  object.likeQuotes = reader.readObjectOrNull<Quote>(
        offsets[0],
        QuoteSchema.deserialize,
        allOffsets,
      ) ??
      Quote();
  return object;
}

P _likeQuoteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
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

Id _likeQuoteGetId(LikeQuote object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _likeQuoteGetLinks(LikeQuote object) {
  return [];
}

void _likeQuoteAttach(IsarCollection<dynamic> col, Id id, LikeQuote object) {
  object.id = id;
}

extension LikeQuoteQueryWhereSort
    on QueryBuilder<LikeQuote, LikeQuote, QWhere> {
  QueryBuilder<LikeQuote, LikeQuote, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LikeQuoteQueryWhere
    on QueryBuilder<LikeQuote, LikeQuote, QWhereClause> {
  QueryBuilder<LikeQuote, LikeQuote, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LikeQuote, LikeQuote, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LikeQuote, LikeQuote, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LikeQuote, LikeQuote, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LikeQuote, LikeQuote, QAfterWhereClause> idBetween(
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
}

extension LikeQuoteQueryFilter
    on QueryBuilder<LikeQuote, LikeQuote, QFilterCondition> {
  QueryBuilder<LikeQuote, LikeQuote, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LikeQuote, LikeQuote, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LikeQuote, LikeQuote, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LikeQuote, LikeQuote, QAfterFilterCondition> idBetween(
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

extension LikeQuoteQueryObject
    on QueryBuilder<LikeQuote, LikeQuote, QFilterCondition> {
  QueryBuilder<LikeQuote, LikeQuote, QAfterFilterCondition> likeQuotes(
      FilterQuery<Quote> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'likeQuotes');
    });
  }
}

extension LikeQuoteQueryLinks
    on QueryBuilder<LikeQuote, LikeQuote, QFilterCondition> {}

extension LikeQuoteQuerySortBy on QueryBuilder<LikeQuote, LikeQuote, QSortBy> {}

extension LikeQuoteQuerySortThenBy
    on QueryBuilder<LikeQuote, LikeQuote, QSortThenBy> {
  QueryBuilder<LikeQuote, LikeQuote, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LikeQuote, LikeQuote, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension LikeQuoteQueryWhereDistinct
    on QueryBuilder<LikeQuote, LikeQuote, QDistinct> {}

extension LikeQuoteQueryProperty
    on QueryBuilder<LikeQuote, LikeQuote, QQueryProperty> {
  QueryBuilder<LikeQuote, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LikeQuote, Quote, QQueryOperations> likeQuotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeQuotes');
    });
  }
}
