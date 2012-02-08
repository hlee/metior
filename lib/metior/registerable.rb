# This code is free software; you can redistribute it and/or modify it under
# the terms of the new BSD License.
#
# Copyright (c) 2012, Sebastian Staudt

# @author Sebastian Staudt
module Metior::Registerable

  # Sets the symbolic name for this component and registers it
  #
  # @param [Symbol] name The symbolic name for this component
  def as(name)
    Metior.register name, self
    class_variable_set :@@id, name
  end

  # Returns the symbolic name of this adapter
  #
  # @return [Symbol] The symbolic name of this adapter
  def id
    class_variable_get :@@id
  end

end