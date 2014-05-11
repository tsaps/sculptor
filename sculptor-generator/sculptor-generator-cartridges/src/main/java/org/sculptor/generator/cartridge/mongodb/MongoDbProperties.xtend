/*
 * Copyright 2014 The Sculptor Project Team, including the original 
 * author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sculptor.generator.cartridge.mongodb

import javax.inject.Inject
import javax.inject.Named
import org.sculptor.generator.configuration.MutableConfigurationProvider
import org.sculptor.generator.ext.Properties
import org.sculptor.generator.util.PropertiesBase

class MongoDbProperties {

	@Inject extension PropertiesBase propertiesBase
	@Inject extension Properties properties

	/**
	 * Prepare the default values with values inherited from the configuration.
	 */
	@Inject
	protected def initDerivedDefaults(@Named("Mutable Defaults") MutableConfigurationProvider defaultConfiguration) {
		defaultConfiguration.setString("package.mapper", "mapper")
		defaultConfiguration.setString("framework.accessimpl.package", fw("accessimpl.mongodb"))
		defaultConfiguration.setString("framework.accessimpl.prefix", "MongoDb")
		defaultConfiguration.setString("framework.accessimpl.AccessBase",
				"org.sculptor.framework.accessimpl.mongodb.MongoDbAccessBase")
		defaultConfiguration.setString("framework.accessimpl.AccessBaseWithException",
				"org.sculptor.framework.accessimpl.mongodb.MongoDbAccessBaseWithException")
	}

	def mongoDb() {
		getProperty("nosql.provider") == "mongoDb"
	}

	def getMapperPackage() {
		getProperty("package.mapper")
	}

}
