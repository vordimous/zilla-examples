#!/bin/sh
set -x

EXIT=0

# GIVEN
PORT="7151"
INPUT='{"message":"Hello World"}'
EXPECTED='{
  "message": "Hello World"
}'
echo \# Testing grpc.kafka.proxy/grpc.examples.echo.Echo.UnaryEcho
echo PORT="$PORT"
echo INPUT="$INPUT"
echo EXPECTED="$EXPECTED"
echo

# WHEN
OUTPUT=$(docker run --rm -v ./echo.proto:/echo.proto fullstorydev/grpcurl -plaintext -proto echo.proto  -d "$INPUT" host.docker.internal:$PORT grpc.examples.echo.Echo.UnaryEcho)
RESULT=$?
echo RESULT="$RESULT"
# THEN
echo OUTPUT="$OUTPUT"
echo EXPECTED="$EXPECTED"
echo
if [ "$RESULT" -eq 0 ] && [ "$OUTPUT" = "$EXPECTED" ]; then
  echo ✅
else
  echo ❌
  EXIT=1
fi

# GIVEN
PORT="7151"
INPUT='{"message":"Hello World"}'
EXPECTED='{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}
{
  "message": "Hello World"
}'
echo \# Testing grpc.kafka.proxy/grpc.examples.echo.Echo.ServerStreamingEcho
echo PORT="$PORT"
echo INPUT="$INPUT"
echo EXPECTED="$EXPECTED"
echo

# WHEN
OUTPUT=$(docker run --rm -v ./echo.proto:/echo.proto fullstorydev/grpcurl -plaintext -proto echo.proto  -d "$INPUT" host.docker.internal:$PORT grpc.examples.echo.Echo.ServerStreamingEcho)
RESULT=$?
echo RESULT="$RESULT"
# THEN
echo OUTPUT="$OUTPUT"
echo EXPECTED="$EXPECTED"
echo
if [ "$RESULT" -eq 0 ] && [ "$OUTPUT" = "$EXPECTED" ]; then
  echo ✅
else
  echo ❌
  EXIT=1
fi


# GIVEN
PORT="7151"
INPUT='{"message":"Hello World"}'
EXPECTED='{
  "message": "Hello World"
}'
echo \# Testing grpc.kafka.proxy/grpc.examples.echo.Echo.BidirectionalStreamingEcho
echo PORT="$PORT"
echo INPUT="$INPUT"
echo EXPECTED="$EXPECTED"
echo

# WHEN
OUTPUT=$(docker run --rm -v ./echo.proto:/echo.proto fullstorydev/grpcurl -plaintext -proto echo.proto  -d "$INPUT" host.docker.internal:$PORT grpc.examples.echo.Echo.BidirectionalStreamingEcho)
RESULT=$?
echo RESULT="$RESULT"
# THEN
echo OUTPUT="$OUTPUT"
echo EXPECTED="$EXPECTED"
echo
if [ "$RESULT" -eq 0 ] && [ "$OUTPUT" = "$EXPECTED" ]; then
  echo ✅
else
  echo ❌
  EXIT=1
fi

exit $EXIT
