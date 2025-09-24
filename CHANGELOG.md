# Changelog
<!-- next-header -->

## [Unreleased] - ReleaseDate
## [1.0.0] - 2025-9-24

### Breaking change
- `OpenAi.Assistant.Tool.File.Search` Module renamed to `OpenAi.Assistant.Tool.FileSearch`
- `OpenAi.Assistant.Tool.File.SearchFileSearch` Module renamed to `OpenAi.Assistant.Tool.FileSearch.FileSearch`
- `OpenAi.Assistant.Tool.File.SearchTypeOnly` Module renamed to `OpenAi.Assistant.Tool.FileSearch.TypeOnly`
- `"timestamp_granularities[]"` field of `OpenAi.Audio.Transcription.CreateRequest` renamed to `timestamp_granularities` 
- `duration` field of `OpenAi.Audio.Transcription.CreateResponse.VerboseJson` is now a number instead of string.
- `response_format` field of `Chat.Completion.CreateRequest` is now union of type `OpenAi.Response.Format._` instead of `Chat.Completion.Request.CreateResponseFormat`
- `Chat.Completion.StreamOptions` renamed to `Chat.Completion.Stream.Options`

### Added
- Support for streaming operations with a dedicated streaming function.
- Function parameters can now be passed as options in a call to OpenAI.
- New OpenAI APIs
    - Responses (Most advanced interface for generating model responses.)
    - Audio (Speech to text.)
    - Evals (Test and improve model outputs through evaluations.)
    - AuditLog (Logs of user actions and configuration changes within this organization.)
    - Usage (Detailed insights into your activity.)
    - Certificates (Manage Mutual TLS certificates across your organization and projects.)
    - Invites (Invite and manage invitations for an organization.)
    - Operations (Admin API keys enable Organization Owners to programmatically manage various aspects of their organization, including users, projects, and API keys.)
    - Projects (Manage the projects within an organization includes creation, updating, and archiving or projects.)
    - Realtime (Communicate with a multi-modal model in real time over low latency interfaces like WebRTC, WebSocket, and SIP.)
    - Uploads (Creates an intermediate Upload object that you can add Parts to.)
    - Users (Lists all of the users in the organization.)
- Extended chat completion with additional CRUD functions.
- Extended fine tuning with additional CRUD functions, for checkpoint permission.
- Extended vector store with additional file re lated functions

### Fixed
- Typo in `submit_tool_outputs_to_run` (previously `submit_tool_ouputs_to_run`).

## [0.4.5] - 2024-9-16
## [0.4.4] - 2024-9-16
## [0.4.3] - 2024-8-12
### Fixed
- Documentation github branch

## [0.4.2] - 2024-8-12
### Fixed
- Documentation links to github

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
[Unreleased]: https://github.com/wois-org/open-api-open-ai/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/wois-org/open-api-open-ai/compare/v0.4.5...v1.0.0
[0.4.5]: https://github.com/wois-org/open-api-open-ai/compare/v0.4.4...v0.4.5
[0.4.4]: https://github.com/wois-org/open-api-open-ai/compare/v0.4.3...v0.4.4
[0.4.3]: https://github.com/wois-org/open-api-open-ai/compare/v0.4.2...v0.4.3
[0.4.2]: https://github.com/wois-org/open-api-open-ai/compare/v0.4.1...v0.4.2
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