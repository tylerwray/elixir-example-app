defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "deletes a value by key", %{bucket: bucket} do
    KV.Bucket.put(bucket, "eggs", 4)
    assert KV.Bucket.get(bucket, "eggs") == 4

    value = KV.Bucket.delete(bucket, "eggs")
    assert value == 4
    assert KV.Bucket.get(bucket, "eggs") == nil
  end
end