require 'sass'

module Sprockets
  # This custom importer that tracks all imported filenames during
  # compile.
  class SassImporter < Sass::Importers::Filesystem
    attr_reader :imported_filenames

    def initialize(root)
      @imported_filenames = []
      super root.to_s
    end

    def find_relative(*args)
      engine = super
      if engine && (filename = engine.options[:filename])
        @imported_filenames << filename
      end
      engine
    end

    def find(*args)
      engine = super
      if engine && (filename = engine.options[:filename])
        @imported_filenames << filename
      end
      engine
    end
  end
end
