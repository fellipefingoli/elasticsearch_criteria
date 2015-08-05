module ElasticsearchCriteria

	def query &block
		{ query: Object.new.extend(ElasticsearchCriteria).instance_eval(&block) }
	end

	def filtered &block
		{ filtered: Object.new.extend(ElasticsearchCriteria).instance_eval(&block) }
	end

	def filter &block
		{ filter: Object.new.extend(ElasticsearchCriteria).instance_eval(&block) }		
	end

	def bool &block
		{ bool: Object.new.extend(ElasticsearchCriteria).instance_eval(&block) }		
	end

	def match text, *args
		{ multi_match: { query: text, fields: args } }
	end

	def must *args, &block
		terms = build_terms args
		hash = if block_given? then { must: block.call(terms)} else { must: terms } end
		if self.class == Hash then self.merge! hash else hash.extend ElasticsearchCriteria end
	end

	def must_not *args, &block
		terms = build_terms args
		hash = if block_given? then { must_not: block.call(terms)} else { must_not: terms } end
		if self.class == Hash then self.merge! hash else hash.extend ElasticsearchCriteria end
	end

	def should *args, &block
		terms = build_terms args
		hash = if block_given? then { should: block.call(terms)} else { should: terms } end
		if self.class == Hash then self.merge! hash else hash.extend ElasticsearchCriteria end
	end

	def sort &block
		hash = { sort: block.call([]) }
		if self.class == Hash then self.merge! hash else hash.extend ElasticsearchCriteria end
	end

	def size value
		hash = { size: value }
		if self.class == Hash then self.merge! hash else hash.extend ElasticsearchCriteria end
	end

	def from value
		hash = { from: value }
		if self.class == Hash then self.merge! hash else hash.extend ElasticsearchCriteria end
	end

	def aggs &block
		hash = { aggs: block.call({}) }
		if self.class == Hash then self.merge! hash else hash.extend ElasticsearchCriteria end
	end

	private 

	def build_terms args
		terms = []
		if args.compact.present?
			args.shift.each do |key,value|
				values = { key.to_sym => (value.split(",") rescue "" )}
				terms.push ({terms: values})
			end
		end
		terms
	end

end
