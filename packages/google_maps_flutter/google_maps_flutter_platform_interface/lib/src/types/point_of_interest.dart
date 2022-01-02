// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' show hashValues;

import 'package:meta/meta.dart';

import '../../google_maps_flutter_platform_interface.dart';

/// A pair of latitude and longitude coordinates, stored as degrees.
class PointOfInterest {
  /// Creates a PointOfInterest
  const PointOfInterest(
      LatLng this.position, String this.name, String this.placeId);

  /// The LatLng of the POI.
  final LatLng position;

  /// The name of the POI.
  final String name;

  /// The placeId of the POI.
  final String placeId;

  /// Converts this object to something serializable in JSON.
  Object toJson() {
    return <String, Object>{
      "position": position.toJson(),
      "name": name,
      "placeId": placeId,
    };
  }

  /// Initialize a LatLng from an \[lat, lng\] array.
  static PointOfInterest? fromJson(Object? json) {
    if (json == null) {
      return null;
    }
    assert(json is Map<String, dynamic> && json.length == 3);
    final data = json as Map<String, dynamic>;
    return PointOfInterest(
        LatLng.fromJson(data["position"])!, data["location"], data["location"]);
  }

  @override
  String toString() => '$runtimeType($position, $name, $placeId)';

  @override
  bool operator ==(Object o) {
    return o is PointOfInterest &&
        o.position == position &&
        o.name == name &&
        o.placeId == placeId;
  }

  @override
  int get hashCode => hashValues(position, name, placeId);
}
