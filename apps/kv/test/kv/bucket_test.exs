defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    bucket = start_supervised!(KV.Bucket)
    %{bucket: bucket}
  end

  test "stores value by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "deletes value", %{bucket: bucket} do
    KV.Bucket.put(bucket, "eggs", 2)
    assert KV.Bucket.delete(bucket, "eggs") == 2
  end

  test "deletes non-existent key", %{bucket: bucket} do
    assert KV.Bucket.delete(bucket, "spam") == nil
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(KV.Bucket, []).restart == :temporary
  end
end
