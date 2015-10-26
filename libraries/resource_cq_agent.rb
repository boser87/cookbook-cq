#
# Cookbook Name:: cq
# Resource:: agent
#
# Copyright (C) 2015 Jakub Wadolowski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class Resource
    class CqAgent < Chef::Resource
      provides :cq_agent, :on_platforms => :all

      attr_accessor :jcr_node

      attr_accessor :jcr_child_path
      attr_accessor :jcr_child

      attr_accessor :jcr_parent_path
      attr_accessor :jcr_parent

      attr_accessor :decrypted_password

      def initialize(name, run_context = nil)
        super

        @resource_name = :cq_agent
        @allowed_actions = [:create, :delete, :modify]
        @action = :create

        @path = name
        @username = nil
        @password = nil
        @instance = nil
        @properties = {}
        @append = true
      end

      def path(arg = nil)
        set_or_return(:path, arg, :kind_of => String)
      end

      def username(arg = nil)
        set_or_return(:username, arg, :kind_of => String)
      end

      def password(arg = nil)
        set_or_return(:password, arg, :kind_of => String)
      end

      def instance(arg = nil)
        set_or_return(:instance, arg, :kind_of => String)
      end

      def properties(arg = nil)
        set_or_return(:properties, arg, :kind_of => Hash)
      end

      def append(arg = nil)
        set_or_return(:append, arg, :kind_of => [TrueClass, FalseClass])
      end
    end
  end
end
