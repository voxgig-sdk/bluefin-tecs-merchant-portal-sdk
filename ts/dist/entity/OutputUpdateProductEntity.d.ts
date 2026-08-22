import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputUpdateProduct, OutputUpdateProductCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class OutputUpdateProductEntity extends BluefinTecsMerchantPortalEntityBase<OutputUpdateProduct> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputUpdateProductEntity): OutputUpdateProductEntity;
    create(this: any, reqdata?: OutputUpdateProductCreateData, ctrl?: Control): Promise<OutputUpdateProductEntity>;
}
export { OutputUpdateProductEntity };
