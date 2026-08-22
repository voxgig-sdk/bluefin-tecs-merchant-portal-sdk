import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputStart, OutputStartCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class OutputStartEntity extends BluefinTecsMerchantPortalEntityBase<OutputStart> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputStartEntity): OutputStartEntity;
    create(this: any, reqdata?: OutputStartCreateData, ctrl?: Control): Promise<OutputStartEntity>;
}
export { OutputStartEntity };
