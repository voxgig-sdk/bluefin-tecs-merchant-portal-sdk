import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputAddProduct, OutputAddProductCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class OutputAddProductEntity extends BluefinTecsMerchantPortalEntityBase<OutputAddProduct> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputAddProductEntity): OutputAddProductEntity;
    create(this: any, reqdata?: OutputAddProductCreateData, ctrl?: Control): Promise<OutputAddProductEntity>;
}
export { OutputAddProductEntity };
