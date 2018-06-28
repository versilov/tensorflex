defmodule Tensorflex do
  @on_load :load_nifs

  def load_nifs do
    :erlang.load_nif("priv/Tensorflex", 0)
  end

  def create_matrix(_nrows, _ncolumns, _list) do
    raise "NIF create_matrix/3 not implemented"
  end

  def matrix_pos(_matrix, _row, _column) do
    raise "NIF matrix_pos/3 not implemented"
  end

  def size_of_matrix(_matrix) do
    raise "NIF size_of_matrix/1 not implemented"
  end

  def matrix_to_lists(_matrix) do
    raise "NIF matrix_to_term/1 not implemented"
  end

  def version do
    raise "NIF tf_version/0 not implemented"
  end

  def read_graph(_filepath) do
    raise "NIF read_graph/1 not implemented"
  end

  def get_graph_ops(_graph) do
    raise "NIF get_graph_ops/1 not implemented"
  end

  def float64_tensor(_float) do
    raise "NIF float_tensor64/1 not implemented"
  end

  def float64_tensor(_values, _dims) do
    raise "NIF float_tensor64/2 not implemented"
  end

  def float32_tensor(_float) do
    raise "NIF float_tensor32/1 not implemented"
  end

  def float32_tensor(_values, _dims) do
    raise "NIF float_tensor32/2 not implemented"
  end

  def string_tensor(_string) do
    raise "NIF string_tensor/1 not implemented"
  end

  defp tf_type(:float32), do: 1
  defp tf_type(:float64), do: 2
  defp tf_type(:int32), do: 3
  defp tf_type(:byte), do: 4

  defp shape_to_binary(shape) when is_tuple(shape), do: Tuple.to_list(shape) |> shape_to_binary()
  defp shape_to_binary([]), do: <<>>

  defp shape_to_binary([dim | rest]),
    do: <<dim::signed-integer-little-64, shape_to_binary(rest)::binary>>

  def tensor_from_matrex(%Matrex{data: data, shape: shape, type: type}),
    do: new_tensor(tf_type(type), shape_to_binary(shape), data)

  def new_tensor(_type, _dims, _data) do
    raise "NIF new_tensor/3 not implemented"
  end

  def tensor_datatype(_tensor) do
    raise "NIF tensor_datatype/1 not implemented"
  end

  def float32_tensor_alloc(_dims) do
    raise "NIF float32_tensor_alloc/1 not implemented"
  end

  def float64_tensor_alloc(_dims) do
    raise "NIF float64_tensor_alloc/1 not implemented"
  end

  def run_session(_graph, _input_tensor, _output_tensor, _input_opname, _output_opname) do
    raise "NIF run_session/5 not implemented"
  end
end
