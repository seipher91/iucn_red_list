part of 'region_cubit.dart';

abstract class RegionState extends Equatable {
  final List<Region> regions;

  const RegionState([this.regions = const []]);

  @override
  List<Object?> get props => [regions];
}

class RegionInit extends RegionState {
  RegionInit() : super();
}

class RegionLoading extends RegionState {
  const RegionLoading([List<Region> regions = const []]) : super(regions);
}

class RegionLoaded extends RegionState {
  const RegionLoaded([List<Region> regions = const []]) : super(regions);
}

class RegionError extends RegionState {
  final String message;
  const RegionError(this.message, [List<Region> regions = const []])
      : super(regions);
}
