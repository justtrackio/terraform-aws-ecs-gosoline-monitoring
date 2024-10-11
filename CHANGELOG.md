## [2.5.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.4.0...v2.5.0) (2024-10-11)


### Features

* skip faulty version for aws provider ([#85](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/85)) ([1fe7157](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/1fe7157031c2989517182bbace87e0ce7d0f90fb))

## [2.4.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.3.2...v2.4.0) (2024-06-21)


### Features

* added kibana spaces and data views support ([#71](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/71)) ([cabd861](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/cabd8616c728db496d514b76ce8237a698752e0f))

## [2.3.2](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.3.1...v2.3.2) (2024-05-24)


### Bug Fixes

* use maps for alarm overwrites to correctly target individual alarms ([#72](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/72)) ([488fbe8](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/488fbe8e2ea985683f1ad36c5025aead988cbfdc))

## [2.3.1](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.3.0...v2.3.1) (2024-05-07)


### Bug Fixes

* kinsumers with same name crashed module ([#69](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/69)) ([361cbe6](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/361cbe69b6248dce6979119c7ca62b4d5edab4dc))

## [2.3.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.2.1...v2.3.0) (2024-02-14)


### Features

* renamed apiserver to httpserver ([#55](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/55)) ([baa0df3](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/baa0df3b1621141f4e3d8d90a967114cf3cbc70e))

## [2.2.1](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.2.0...v2.2.1) (2023-11-21)


### Bug Fixes

* adjust provider data resource ([#50](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/50)) ([16e8c64](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/16e8c64127a19c6fbd12c0ca2d78c87031e6768f))

## [2.2.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.1.3...v2.2.0) (2023-11-21)


### Features

* update ecs alarm modules ([#49](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/49)) ([377e03b](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/377e03bf57b951c73945fdfd738112deedae27dc))

## [2.1.2](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.1.1...v2.1.2) (2023-08-17)


### Bug Fixes

* allow-provider-versions-to-be-fixed-on-the-calling-part ([#33](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/33)) ([b930f00](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/b930f00cafd046b5e7a64bdd8b1ba41b3bd224b5))

## [2.1.1](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.1.0...v2.1.1) (2023-07-27)


### Bug Fixes

* logging panel ([#32](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/32)) ([6da04e9](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/6da04e991d97f0a1a12dc34914a61aab533cf868))

## [2.1.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.0.1...v2.1.0) (2023-07-26)


### Features

* bump gosoline provider ([#29](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/29)) ([075e62d](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/075e62d7469b0cd8b7bafda72a1081515ac4febc))

## [2.0.1](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v2.0.0...v2.0.1) (2023-05-31)


### Bug Fixes

* remove_provider_config_in_favor_of_count ([#23](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/23)) ([2ac058d](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/2ac058d570f443de7944fe4d62d6484ca20f1b70))

## [2.0.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v1.3.0...v2.0.0) (2023-05-24)


### ⚠ BREAKING CHANGES

* add_custom_config (#14)

### Features

* add_custom_config ([#14](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/14)) ([87b0767](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/87b076729206f8493d46ac57f5c1b07488567fb2))

## [1.3.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v1.2.0...v1.3.0) (2023-03-28)


### Features

* adjust_alarm_description_json ([#10](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/10)) ([4b1ca01](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/4b1ca0183afc566353cb16a6aebfc9313078ddb1))

## [1.2.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v1.1.1...v1.2.0) (2023-03-21)


### Features

* switch to official elastic provider ([#8](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/8)) ([65ba830](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/65ba830c534c9d509c89df48d651d6c2f5d254a0))

## [1.1.1](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v1.1.0...v1.1.1) (2023-03-20)


### Bug Fixes

* add kibana index pattern ([#7](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/7)) ([c55a62d](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/c55a62d5056cb7f08d9a0814e12bca0cad898700))

## [1.1.0](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/compare/v1.0.0...v1.1.0) (2023-03-16)


### Features

* add scheduled alarms ([#6](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/6)) ([f252222](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/f25222281431aa3e5750ca112a8bf268d498e726))

## 1.0.0 (2023-03-07)


### Features

* create module ([#1](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/issues/1)) ([c471009](https://github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring/commit/c4710099c11a7bd1b190bfb55e2e966f603fae13))
