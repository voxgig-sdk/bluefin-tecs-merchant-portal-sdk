import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputCreateProduct, OutputCreateProductCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class OutputCreateProductEntity extends BluefinTecsMerchantPortalEntityBase<OutputCreateProduct> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputCreateProductEntity): OutputCreateProductEntity;
    create(this: any, reqdata?: OutputCreateProductCreateData, ctrl?: Control): Promise<OutputCreateProductEntity>;
}
export { OutputCreateProductEntity };
