The `initializationOptions` property of the `initialize` method has different schemas to request for each Language Server,
but we have no way to know the correct schema except to look at the Language Server source code.
So how about adding the following request?

```
Server Capability:
    property path (optional): initializationOptionsSchema
    property type: boolean

Request:
    method: ‘initializationOptionsSchema’

Response:
    result: InitializationOptionsSchema
    error: code and message set in case an exception happens during the ‘workspace/configuration’ request
```

```typescript
export interface InitializationOptionsSchema {
  properties: InitializationOptionsSchemaItemMap
}

export interface InitializationOptionsSchemaItemMap {
  [name: string]: InitializationOptionsSchemaItem;
}

export type JSONSchemaType = 'string' | 'number' | 'integer' | 'boolean' | 'null' | 'array' | 'object';

export interface InitializationOptionsSchemaItem {
  required?: string[];
  type: JSONSchemaType | JSONSchemaType[];
  description?: string;
  markdownDeprecationMessage?: string;
  deprecationMessage?: string;
  default?: any;
  enum?: any[];
  enumDescriptions?: string[];
  maximum?: number;
  minimum?: number;
  maxLength?: number;
  minLength?: number;
  pattern?: string;
  patternErrorMessage?: string;
  format?: string;
  maxItems?: number;
  minItems?: number;
  properties?: InitializationOptionsSchemaItemMap
}
```

Regarding the definition, I have included the necessary items when the user sets it while referring to the following. There may still be excess or deficiency.
https://code.visualstudio.com/api/references/contribution-points#contributes.configuration
https://github.com/microsoft/vscode/blob/dc977941131ce6f2e3dac466bda143caee23af4b/src/vs/base/common/jsonSchema.ts
