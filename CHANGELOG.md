# Changelog
<!-- next-header -->

## [Unreleased] - ReleaseDate

## [0.4.1] - 2024-8-12
### Fixed
- VectorStoreFile delete mock

## [0.4.0] - 2024-7-31
### Added
- Options configuration for HTTPoison request, that maybe set in configuration.

## [0.3.3] - 2024-7-23
### Fixed
- File upload with multipart form-data

## [0.3.2] - 2024-7-23
### Fixed
- Content type headers for file upload

## [0.3.1] - 2024-7-17
### Improved
- Error with body and status code will return a map, also will try to convert body to a map

## [0.3.0] - 2024-7-16
### Changed
- Remove nil values from body of request

## [0.2.5] - 2024-7-11
### Fixed
- Union collapse check if type matches to provided structure 

## [0.2.4] - 2024-7-10
### Fixed 
- Union collapse when one of the types is enum and the value should be in it

## [0.2.3] - 2024-7-10
### Fixed
- Conditionally put body in request based on the request method and if body is present at all

## [0.2.2] - 2024-7-9
- Fixed mix.exs config to add mocks files to package

## [0.2.1] - 2024-7-9
- Fixed mix.exs config to add mocks files to package

## [0.2.0] - 2024-7-9
### Added
- Additional headers will be added to request if configured in `http_headers`
- Mock functions for convince of testing

## [0.1.6] - 2024-7-8
- Pass request query parameters in client to handle list requests

## [0.1.5] - 2024-7-8
- Handle error responses

## [0.1.4] - 2024-7-8
- Added error that all operations return in case of error

## [0.1.3] - 2024-7-5
- Added missing md docs files 

## [0.1.2] - 2024-7-5
- Removed unused schema files
- Updated mix configuration to use poison only for tests
- Updated mix configuration links
- Added license doc

## [0.1.1] - 2024-7-5
- Configured `oapi_generator` 
- Implemented client with requests method that converts arrow map to expected result type
- Written tests for all operations 

<!-- next-url -->
[Unreleased]: https://github.com/wois-org/open-api-open-ai/compare/v0.4.1...HEAD
[0.4.1]: https://github.com/wois-org/open-api-open-ai/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/wois-org/open-api-open-ai/compare/v0.3.3...v0.4.0
[0.3.3]: https://github.com/wois-org/open-api-open-ai/compare/v0.3.2...v0.3.3
[0.3.2]: https://github.com/wois-org/open-api-open-ai/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/wois-org/open-api-open-ai/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/wois-org/open-api-open-ai/compare/v0.2.5...v0.3.0
[0.2.5]: https://github.com/wois-org/open-api-open-ai/compare/v0.2.4...v0.2.5
[0.2.4]: https://github.com/wois-org/open-api-open-ai/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/wois-org/open-api-open-ai/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/wois-org/open-api-open-ai/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/wois-org/open-api-open-ai/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/wois-org/open-api-open-ai/compare/v0.1.6...v0.2.0
[0.1.6]: https://github.com/wois-org/open-api-open-ai/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/wois-org/open-api-open-ai/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/wois-org/open-api-open-ai/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/wois-org/open-api-open-ai/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/wois-org/open-api-open-ai/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/wois-org/open-api-open-ai/compare/627efb7...v0.1.1